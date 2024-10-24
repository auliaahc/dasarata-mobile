import 'package:dasarata_mobile/env/env.dart';
import 'package:dasarata_mobile/models/profile/response_profile_model.dart';
import 'package:dio/dio.dart';

class ProfileService {
  final Dio _dio = Dio();

  Future<ResponseProfileModel> getProfileData() async {
    const url = "${Env.baseUrl}/me";
    // final token = await SharedPref.getToken();
    const token = "1|pMGhaZOKtQkbzVZhq1jqMyI2zaDtpvXV0UjDC6Xsc9765607";
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
      final errorResponse = e.response?.data;
      throw ResponseProfileModel.fromJson(errorResponse);
    }
  }
}
