import 'package:dasarata_mobile/env/env.dart';
import 'package:dasarata_mobile/models/login/request_login_model.dart';
import 'package:dasarata_mobile/models/login/response_login_model.dart';
import 'package:dasarata_mobile/models/response_global_model.dart';
import 'package:dasarata_mobile/utilities/shared_pref.dart';
import 'package:dio/dio.dart';

class AuthenticationService {
  final Dio _dio = Dio();

  Future<ResponseLoginModel> loginWithEmail({required RequestLoginModel model}) async {
    const url = "${Env.baseUrl}/login";
    try {
      final response = await _dio.post(
        url,
        data: model.toJson(),
      );
      final rawResponse = response.data;
      final String token = rawResponse["data"]["token"];
      SharedPref.saveToken(token: token);
      return ResponseLoginModel.fromJson(rawResponse);
    } on DioException catch (e) {
      final errorResponse = e.response?.data;
      if (errorResponse != null) {
        throw ResponseLoginModel.fromJson(errorResponse);
      } else {
        throw ResponseLoginModel(
          success: false,
          message: "Tidak terhubung ke internet",
        );
      }
    }
  }

  Future<ResponseGlobalModel> postLogout() async {
    const url = "${Env.baseUrl}/logout";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.post(
        url,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        })
      );
      final rawResponse = response.data;
      return ResponseGlobalModel.fromJson(rawResponse);
    } on DioException catch (e) {
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
