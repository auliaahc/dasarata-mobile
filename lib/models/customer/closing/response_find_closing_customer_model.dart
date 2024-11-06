class ResponseFindClosingCustomerModel {
  final bool success;
  final String message;
  final Data? data;

  ResponseFindClosingCustomerModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory ResponseFindClosingCustomerModel.fromJson(Map<String, dynamic> json) {
    return ResponseFindClosingCustomerModel(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: Data.fromJson(json["data"]),
    );
  }
}

class Data {
  final int id;
  final int prospectCustomerId;
  final String nik;
  final String fullName;
  final String domicileAddress;
  final DateTime dateOfBirth;
  final String gender;
  final int provincesId;
  final int regencyId;
  final int districtId;
  final int villageId;
  final String rt;
  final String rw;
  final String photoKtpUrl;
  final String customerCategory;
  final int servicePackageId;
  final int programId;
  final int coverageAreaId;
  final int spliterId;
  final String installedAddress;
  final double latitude;
  final double longitude;
  final String photoHomeUrl;
  final String phaseStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.prospectCustomerId,
    required this.nik,
    required this.fullName,
    required this.domicileAddress,
    required this.dateOfBirth,
    required this.gender,
    required this.provincesId,
    required this.regencyId,
    required this.districtId,
    required this.villageId,
    required this.rt,
    required this.rw,
    required this.photoKtpUrl,
    required this.customerCategory,
    required this.servicePackageId,
    required this.programId,
    required this.coverageAreaId,
    required this.spliterId,
    required this.installedAddress,
    required this.latitude,
    required this.longitude,
    required this.photoHomeUrl,
    required this.phaseStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"] ?? 0,
      prospectCustomerId: json["prospect_customer_id"] ?? 0,
      nik: json["nik"] ?? "",
      fullName: json["full_name"] ?? "",
      domicileAddress: json["domicile_address"] ?? "",
      dateOfBirth: DateTime.parse(json["date_of_birth"]),
      gender: json["gender"] ?? "",
      provincesId: json["provinces_id"] ?? 0,
      regencyId: json["regency_id"] ?? 0,
      districtId: json["district_id"] ?? 0,
      villageId: json["village_id"] ?? 0,
      rt: json["rt"] ?? "",
      rw: json["rw"] ?? "",
      photoKtpUrl: json["photo_ktp_url"] ?? "",
      customerCategory: json["custmer_category"] ?? "",
      servicePackageId: json["service_package_id"] ?? 0,
      programId: json["program_id"] ?? 0,
      coverageAreaId: json["coverage_area_id"] ?? 0,
      spliterId: json["spliter_id"] ?? 0,
      installedAddress: json["installed_address"] ?? "",
      latitude: json["latitude"]?.toDouble() ?? 0,
      longitude: json["longitude"]?.toDouble() ?? 0,
      photoHomeUrl: json["photo_home_url"] ?? "",
      phaseStatus: json["phase_status"] ?? "",
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }
}
