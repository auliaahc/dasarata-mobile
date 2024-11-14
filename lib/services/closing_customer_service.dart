import 'package:dasarata_mobile/env/env.dart';
import 'package:dasarata_mobile/models/customer/closing/request_route_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/request_spliter_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/request_survey_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/response_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/response_find_closing_customer_model.dart';
import 'package:dasarata_mobile/models/response_global_model.dart';
import 'package:dasarata_mobile/utilities/shared_pref.dart';
import 'package:dio/dio.dart';

class ClosingCustomerService {
  final Dio _dio = Dio();
  final url = "${Env.baseUrl}/sales/closings";

  Future<ResponseClosingCustomerModel> getAllClosingCustomer({
    String? search,
    required int page,
  }) async {
    final finalUrl = url;
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        finalUrl,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
        queryParameters: {"page": page, if (search != null) "search": search},
      );
      final rawResponse = response.data;
      return ResponseClosingCustomerModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw ResponseClosingCustomerModel(
          success: false,
          message: "Sesi berakhir",
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

  Future<ResponseFindClosingCustomerModel> getClosingCustomer(int id) async {
    final finalUrl = "$url/$id/show";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        finalUrl,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      final rawResponse = response.data;
      return ResponseFindClosingCustomerModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw ResponseFindClosingCustomerModel(
          success: false,
          message: "Sesi berakhir",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw ResponseFindClosingCustomerModel.fromJson(errorResponse);
        } else {
          throw ResponseFindClosingCustomerModel(
            success: false,
            message: "Tidak terhubung ke internet",
          );
        }
      }
    }
  }

  Future<ResponseGlobalModel> patchPhaseStatus({
    required int id,
    required dynamic model,
  }) async {
    final finalUrl = "$url/$id/update";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.patch(
        finalUrl,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
        data: model is RequestSurveyClosingCustomerModel
            ? model.toJson()
            : model is RequestSpliterClosingCustomerModel
                ? model.toJson()
                : model is RequestRouteClosingCustomerModel
                    ? model.toJson()
                    : null,
      );
      final rawResponse = response.data;
      return ResponseGlobalModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw ResponseGlobalModel(
          success: false,
          message: "Sesi berakhir",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw ResponseGlobalModel.fromJson(errorResponse);
        } else {
          throw ResponseGlobalModel(
            success: false,
            message: "Tidak terhubung ke internet",
          );
        }
      }
    }
  }
}
