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
      data: json["data"] != null ? Data.fromJson(json["data"]) : null,
    );
  }
}

class Data {
  final int id;
  final String nik;
  final String name;
  final String domicileAddress;
  final String dateOfBirth;
  final String gender;
  final Location provinces;
  final Location regency;
  final Location district;
  final Location village;
  final String rt;
  final String rw;
  final String photoKtpUrl;
  final String phoneNumber;
  final String? customerCategory;
  final Package package;
  final Program program;
  final Coverage coverage;
  final Spliter spliter;
  final String installedAddress;
  final double latitude;
  final double longitude;
  final String photoHomeUrl;
  final String phaseStatus;
  Data({
    required this.id,
    required this.nik,
    required this.name,
    required this.domicileAddress,
    required this.dateOfBirth,
    required this.gender,
    required this.provinces,
    required this.regency,
    required this.district,
    required this.village,
    required this.rt,
    required this.rw,
    required this.photoKtpUrl,
    required this.phoneNumber,
    this.customerCategory,
    required this.package,
    required this.program,
    required this.coverage,
    required this.spliter,
    required this.installedAddress,
    required this.latitude,
    required this.longitude,
    required this.photoHomeUrl,
    required this.phaseStatus,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"] ?? 0,
      nik: json["nik"] ?? "",
      name: json["name"] ?? "",
      domicileAddress: json["domicile_address"] ?? "",
      dateOfBirth: json["date_of_birth"] ?? "",
      gender: json["gender"] ?? "",
      provinces: Location.fromJson(json["provinces"]),
      regency: Location.fromJson(json["regency"]),
      district: Location.fromJson(json["district"]),
      village: Location.fromJson(json["village"]),
      rt: json["rt"] ?? "",
      rw: json["rw"] ?? "",
      photoKtpUrl: json["photo_ktp_url"] ?? "",
      phoneNumber: json["phone_number"] ?? "",
      customerCategory: json["customer_category"],
      package: Package.fromJson(json["package"]),
      program: Program.fromJson(json["program"]),
      coverage: Coverage.fromJson(json["coverage"]),
      spliter: Spliter.fromJson(json["spliter"]),
      installedAddress: json["installed_address"] ?? "",
      latitude: json["latitude"]?.toDouble() ?? 0.0,
      longitude: json["longitude"]?.toDouble() ?? 0.0,
      photoHomeUrl: json["photo_home_url"] ?? "",
      phaseStatus: json["phase_status"] ?? "",
    );
  }
}

class Location {
  final int id;
  final String name;
  Location({
    required this.id,
    required this.name,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json.values.first as int,
      name: json["name"] ?? "",
    );
  }
}

class Package {
  final int servicePackageId;
  final String namePackage;
  Package({
    required this.servicePackageId,
    required this.namePackage,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      servicePackageId: json["service_package_id"] ?? 0,
      namePackage: json["name_package"] ?? "",
    );
  }
}

class Program {
  final int programId;
  final String nameProgram;
  Program({
    required this.programId,
    required this.nameProgram,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      programId: json["program_id"] ?? 0,
      nameProgram: json["name_program"] ?? "",
    );
  }
}

class Coverage {
  final int coverageAreaId;
  final String nameCoverage;
  Coverage({
    required this.coverageAreaId,
    required this.nameCoverage,
  });

  factory Coverage.fromJson(Map<String, dynamic> json) {
    return Coverage(
      coverageAreaId: json["coverage_area_id"] ?? 0,
      nameCoverage: json["name_coverage"] ?? "",
    );
  }
}

class Spliter {
  final int spliterId;
  final String spliterName;
  Spliter({
    required this.spliterId,
    required this.spliterName,
  });

  factory Spliter.fromJson(Map<String, dynamic> json) {
    return Spliter(
      spliterId: json["spliter_id"] ?? 0,
      spliterName: json["spliter_name"] ?? "",
    );
  }
}
