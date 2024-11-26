import 'package:dasarata_mobile/env/env.dart';
import 'package:dasarata_mobile/models/profile/response_profile_model.dart';
import 'package:dasarata_mobile/utilities/shared_pref.dart';
import 'package:dio/dio.dart';

class ProfileService {
  final Dio _dio = Dio();

  Future<ResponseProfileModel> getProfile() async {
    const url = "${Env.baseUrl}/me";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      final rawResponse = response.data;
      return ResponseProfileModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw ResponseProfileModel(
          success: false,
          message: "Sesi berakhir",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw ResponseProfileModel.fromJson(errorResponse);
        } else {
          throw ResponseProfileModel(
            success: false,
            message: "Tidak terhubung ke internet",
          );
        }
      }
    }
  }
}
