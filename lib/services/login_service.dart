import 'package:dasarata_mobile/env/env.dart';
import 'package:dasarata_mobile/models/login/request_login_model.dart';
import 'package:dasarata_mobile/models/login/response_login_model.dart';
import 'package:dasarata_mobile/utilities/shared_pref.dart';
import 'package:dio/dio.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<ResponseLoginModel> loginWithEmail(RequestLoginModel requestLoginModel) async {
    const url = "${Env.baseUrl}/login";
    try {
      final response = await _dio.post(
        url,
        data: requestLoginModelToJson(requestLoginModel),
      );
      final rawResponse = response.data;
      if (response.statusCode == 200) {
        final String token = rawResponse["data"]["token"];
        SharedPref.saveToken(token: token);
        return ResponseLoginModel(
          success: response.data["success"],
          message: response.data["message"],
        );
      } else {
        return responseLoginModelFromJson(rawResponse);
      }
    } on DioException catch (e) {
      throw ResponseLoginModel(
        success: e.response?.data["success"],
        message: e.response?.data["message"],
      );
    }
  }
}
