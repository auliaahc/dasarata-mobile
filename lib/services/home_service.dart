import 'package:dasarata_mobile/env/env.dart';
import 'package:dasarata_mobile/models/home/response_home_model.dart';
import 'package:dasarata_mobile/utilities/shared_pref.dart';
import 'package:dio/dio.dart';

class HomeService {
  final Dio _dio = Dio();

  Future<ResponseHomeModel> getHomeData() async {
    const url = "${Env.baseUrl}/sales";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      final rawResponse = response.data;
      return ResponseHomeModel.fromJson(rawResponse);
    } on DioException catch (e) {
      final errorResponse = e.response?.data;
      throw ResponseHomeModel.fromJson(errorResponse);
    }
  }
}
