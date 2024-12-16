import 'package:dasarata_mobile/env/env.dart';
import 'package:dasarata_mobile/models/customer/closing/district_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/program_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/province_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/regency_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/request_add_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/request_route_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/request_spliter_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/request_survey_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/response_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/response_find_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/service_package_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/village_closing_customer_model.dart';
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

  Future<ServicePackageClosingCustomerModel> getServicePackages() async {
    const finalUrl = "${Env.baseUrl}/sales/service-packages";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        finalUrl,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      final rawResponse = response.data;
      return ServicePackageClosingCustomerModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw ServicePackageClosingCustomerModel(
          success: false,
          message: "Sesi berakhir",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw ServicePackageClosingCustomerModel.fromJson(errorResponse);
        } else {
          throw ServicePackageClosingCustomerModel(
            success: false,
            message: "Tidak terhubung ke internet",
          );
        }
      }
    }
  }

  Future<ProgramClosingCustomerModel> getPrograms() async {
    const finalUrl = "${Env.baseUrl}/sales/programs";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        finalUrl,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      final rawResponse = response.data;
      return ProgramClosingCustomerModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw ProgramClosingCustomerModel(
          success: false,
          message: "Sesi berakhir",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw ProgramClosingCustomerModel.fromJson(errorResponse);
        } else {
          throw ProgramClosingCustomerModel(
            success: false,
            message: "Tidak terhubung ke internet",
          );
        }
      }
    }
  }

  Future<ProvinceClosingCustomerModel> getProvinces() async {
    const finalUrl = "${Env.baseUrl}/sales/regionals/provinces";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        finalUrl,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      final rawResponse = response.data;
      return ProvinceClosingCustomerModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw ProvinceClosingCustomerModel(
          success: false,
          message: "Sesi berakhir",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw ProvinceClosingCustomerModel.fromJson(errorResponse);
        } else {
          throw ProvinceClosingCustomerModel(
            success: false,
            message: "Tidak terhubung ke internet",
          );
        }
      }
    }
  }

  Future<RegencyClosingCustomerModel> getRegencies(int provinceId) async {
    final finalUrl = "${Env.baseUrl}/sales/regionals/$provinceId/regencies";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        finalUrl,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      final rawResponse = response.data;
      return RegencyClosingCustomerModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw RegencyClosingCustomerModel(
          success: false,
          message: "Sesi berakhir",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw RegencyClosingCustomerModel.fromJson(errorResponse);
        } else {
          throw RegencyClosingCustomerModel(
            success: false,
            message: "Tidak terhubung ke internet",
          );
        }
      }
    }
  }

  Future<DistrictClosingCustomerModel> getDistricts(int regencyId) async {
    final finalUrl = "${Env.baseUrl}/sales/regionals/$regencyId/districts";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        finalUrl,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      final rawResponse = response.data;
      return DistrictClosingCustomerModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw DistrictClosingCustomerModel(
          success: false,
          message: "Sesi berakhir",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw DistrictClosingCustomerModel.fromJson(errorResponse);
        } else {
          throw DistrictClosingCustomerModel(
            success: false,
            message: "Tidak terhubung ke internet",
          );
        }
      }
    }
  }

  Future<VillageClosingCustomerModel> getVillages(int districtId) async {
    final finalUrl = "${Env.baseUrl}/sales/regionals/$districtId/villages";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        finalUrl,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      final rawResponse = response.data;
      return VillageClosingCustomerModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw VillageClosingCustomerModel(
          success: false,
          message: "Sesi berakhir",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw VillageClosingCustomerModel.fromJson(errorResponse);
        } else {
          throw VillageClosingCustomerModel(
            success: false,
            message: "Tidak terhubung ke internet",
          );
        }
      }
    }
  }

  Future<ResponseGlobalModel> createClosingCustomer({
    required RequestAddClosingCustomerModel model,
    required int prospectCustomerId,
  }) async {
    final finalUrl = "$url/$prospectCustomerId/store-closing";
    final token = await SharedPref.getToken();
    try {
      final formData = FormData.fromMap({
        ...model.toJson(),
        "photo_home_url": await MultipartFile.fromFile(
          model.photoHome.path,
          filename: model.photoHome.path.split("/").last,
        ),
        "photo_ktp_url": await MultipartFile.fromFile(
          model.photoKtp.path,
          filename: model.photoKtp.path.split("/").last,
        ),
      });
      final response = await _dio.post(
        finalUrl,
        data: formData,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
          contentType: "multipart/form-data",
          followRedirects: false,
        )
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
