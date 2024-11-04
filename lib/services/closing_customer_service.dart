import 'package:dasarata_mobile/env/env.dart';
import 'package:dasarata_mobile/models/customer/closing/response_closing_customer_model.dart';
import 'package:dasarata_mobile/utilities/shared_pref.dart';
import 'package:dio/dio.dart';

class ClosingCustomerService {
  final Dio _dio = Dio();
  final url = "${Env.baseUrl}/sales";

  Future<ResponseClosingCustomerModel> getAllClosingCustomer({String? search, required int page}) async {
    final finalUrl = "$url/closings";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        finalUrl,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
        queryParameters: {
          "page": page,
          if (search != null) "search": search
        },
      );
      final rawResponse = response.data;
      return ResponseClosingCustomerModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw ResponseClosingCustomerModel(
          success: false,
          message: "404: Data tidak ditemukan",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw ResponseClosingCustomerModel.fromJson(errorResponse);
        } else {
          throw ResponseClosingCustomerModel(
            success: false,
            message: "Tidak terhubung ke internet",
          );
        }
      }
    }
  }
}
