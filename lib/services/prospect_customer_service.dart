import 'package:dasarata_mobile/env/env.dart';
import 'package:dasarata_mobile/models/customer/prospect/category_prospect_customer_model.dart';
import 'package:dasarata_mobile/models/customer/prospect/meet_prospect_customer_model.dart';
import 'package:dasarata_mobile/models/customer/prospect/request_form_prospect_customer_model.dart';
import 'package:dasarata_mobile/models/customer/prospect/response_form_prospect_customer_model.dart';
import 'package:dasarata_mobile/models/customer/prospect/response_prospect_customer_model.dart';
import 'package:dasarata_mobile/utilities/shared_pref.dart';
import 'package:dio/dio.dart';

class ProspectCustomerService {
  final Dio _dio = Dio();
  final url = "${Env.baseUrl}/sales";

  Future<ResponseProspectCustomerModel> getAllProspectCustomerData({String? search}) async {
    final finalUrl = "$url/prospect";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        finalUrl,
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

  Future<CategoryProspectCustomerModel> getProspectCategory() async {
    final finalUrl = "$url/prospect-category";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        finalUrl,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      final rawResponse = response.data;
      return CategoryProspectCustomerModel.fromJson(rawResponse);
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

  Future<MeetProspectCustomerModel> getProspectMeet() async {
    final finalUrl = "$url/prospect-meet";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        finalUrl,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      final rawResponse = response.data;
      return MeetProspectCustomerModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw MeetProspectCustomerModel(
          success: false,
          message: "404: Data tidak ditemukan",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw MeetProspectCustomerModel.fromJson(errorResponse);
        } else {
          throw MeetProspectCustomerModel(
            success: false,
            message: "Tidak terhubung ke internet",
          );
        }
      }
    }
  }

  Future<ResponseFormProspectCustomerModel> postCreateProspectCustomer(RequestFormProspectCustomerModel data) async {
    final finalUrl = "$url/prospect";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.post(
        finalUrl,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
        data: data.toJson(),
      );
      final rawResponse = response.data;
      return ResponseFormProspectCustomerModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw ResponseFormProspectCustomerModel(
          success: false,
          message: "404: Data tidak ditemukan",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw ResponseFormProspectCustomerModel.fromJson(errorResponse);
        } else {
          throw ResponseFormProspectCustomerModel(
            success: false,
            message: "Tidak terhubung ke internet",
          );
        }
      }
    }
  }
}
