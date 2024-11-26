import 'package:dasarata_mobile/env/env.dart';
import 'package:dasarata_mobile/models/dashboard/dashboard_model.dart';
import 'package:dasarata_mobile/utilities/shared_pref.dart';
import 'package:dio/dio.dart';

class DashboardService {
  final Dio _dio = Dio();

  Future<DashboardModel> getDashboard() async {
    const url = "${Env.baseUrl}/sales";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      final rawResponse = response.data;
      return DashboardModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw DashboardModel(
          success: false,
          message: "Sesi berakhir",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw DashboardModel.fromJson(errorResponse);
        } else {
          throw DashboardModel(
            success: false,
            message: "Tidak terhubung ke internet",
          );
        }
      }
    }
  }
}
