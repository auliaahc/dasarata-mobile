import 'package:dasarata_mobile/env/env.dart';
import 'package:dasarata_mobile/models/customer/prospect/response_prospect_customer_model.dart';
import 'package:dasarata_mobile/utilities/shared_pref.dart';
import 'package:dio/dio.dart';

class ProspectCustomerService {
  final Dio _dio = Dio();

  Future<ResponseProspectCustomerModel> getAllProspectCustomerData({String? search}) async {
    const url = "${Env.baseUrl}/sales/prospect";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
        queryParameters: {if (search != null) "search": search},
      );
      final rawResponse = response.data;
      return ResponseProspectCustomerModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw ResponseProspectCustomerModel(
          success: false,
          message: "404: Data tidak ditemukan",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw ResponseProspectCustomerModel.fromJson(errorResponse);
        } else {
          throw ResponseProspectCustomerModel(
            success: false,
            message: "Tidak terhubung ke internet",
          );
        }
      }
    }
  }
}
