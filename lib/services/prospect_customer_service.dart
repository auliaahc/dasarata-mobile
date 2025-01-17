import 'package:dasarata_mobile/env/env.dart';
import 'package:dasarata_mobile/models/customer/prospect/category_prospect_customer_model.dart';
import 'package:dasarata_mobile/models/customer/prospect/meet_prospect_customer_model.dart';
import 'package:dasarata_mobile/models/customer/prospect/request_form_prospect_customer_model.dart';
import 'package:dasarata_mobile/models/customer/prospect/response_find_prospect_customer_model.dart';
import 'package:dasarata_mobile/models/customer/prospect/response_form_prospect_customer_model.dart';
import 'package:dasarata_mobile/models/customer/prospect/response_prospect_customer_model.dart';
import 'package:dasarata_mobile/utilities/shared_pref.dart';
import 'package:dio/dio.dart';

class ProspectCustomerService {
  final Dio _dio = Dio();
  final url = "${Env.baseUrl}/sales";

  Future<ResponseProspectCustomerModel> getAllProspectCustomer(
      {String? search, required int page}) async {
    final finalUrl = "$url/prospect";
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
      return ResponseProspectCustomerModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw ResponseProspectCustomerModel(
          success: false,
          message: "Sesi berakhir",
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

  Future<ResponseFindProspectCustomerModel> getProspectCustomer(int id) async {
    final finalUrl = "$url/prospect/$id";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(finalUrl,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      final rawResponse = response.data;
      return ResponseFindProspectCustomerModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw ResponseFindProspectCustomerModel(
          success: false,
          message: "Sesi berakhir",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw ResponseFindProspectCustomerModel.fromJson(errorResponse);
        } else {
          throw ResponseFindProspectCustomerModel(
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
      if (e.response?.statusCode == 500) {
        throw CategoryProspectCustomerModel(
          success: false,
          message: "Sesi berakhir",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw CategoryProspectCustomerModel.fromJson(errorResponse);
        } else {
          throw CategoryProspectCustomerModel(
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
      if (e.response?.statusCode == 500) {
        throw MeetProspectCustomerModel(
          success: false,
          message: "Sesi berakhir",
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

  Future<ResponseFormProspectCustomerModel> createProspectCustomer(
      RequestFormProspectCustomerModel model) async {
    final finalUrl = "$url/prospect";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.post(
        finalUrl,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
        data: model.toJson(),
      );
      final rawResponse = response.data;
      return ResponseFormProspectCustomerModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw ResponseFormProspectCustomerModel(
          success: false,
          message: "Sesi berakhir",
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
