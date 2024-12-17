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
  final Coverage? coverage;
  final Spliter? spliter;
  final String installedAddress;
  final double? latitude;
  final double? longitude;
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
    this.coverage,
    this.spliter,
    required this.installedAddress,
    this.latitude,
    this.longitude,
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
      provinces:
          json["provinces"] != null && json["provinces"] is Map<String, dynamic>
              ? Location.fromJson(json["provinces"])
              : Location(id: 0, name: ""),
      regency:
          json["regency"] != null && json["regency"] is Map<String, dynamic>
              ? Location.fromJson(json["regency"])
              : Location(id: 0, name: ""),
      district:
          json["district"] != null && json["district"] is Map<String, dynamic>
              ? Location.fromJson(json["district"])
              : Location(id: 0, name: ""),
      village:
          json["village"] != null && json["village"] is Map<String, dynamic>
              ? Location.fromJson(json["village"])
              : Location(id: 0, name: ""),
      rt: json["rt"] ?? "",
      rw: json["rw"] ?? "",
      photoKtpUrl: json["photo_ktp_url"] ?? "",
      phoneNumber: json["phone_number"] ?? "",
      customerCategory: json["custmer_category"],
      package:
          json["package"] != null && json["package"] is Map<String, dynamic>
              ? Package.fromJson(json["package"])
              : Package(servicePackageId: 0, namePackage: ""),
      program:
          json["program"] != null && json["program"] is Map<String, dynamic>
              ? Program.fromJson(json["program"])
              : Program(programId: 0, nameProgram: "-"),
      coverage:
          json["coverage"] != null && json["coverage"] is Map<String, dynamic>
              ? Coverage.fromJson(json["coverage"])
              : null,
      spliter:
          json["spliter"] != null && json["spliter"] is Map<String, dynamic>
              ? Spliter.fromJson(json["spliter"])
              : null,
      installedAddress: json["installed_address"] ?? "",
      latitude: json["latitude"] != null
          ? (json["latitude"] as num).toDouble()
          : null,
      longitude: json["longitude"] != null
          ? (json["longitude"] as num).toDouble()
          : null,
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
      nameProgram: json["name_program"] ?? "-",
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
      nameCoverage: json["name_coverage"] ?? "-",
    );
  }
}

class Spliter {
  final int spliterId;
  final String spliterName;
  final double latitude;
  final double longitude;
  Spliter({
    required this.spliterId,
    required this.spliterName,
    required this.latitude,
    required this.longitude,
  });

  factory Spliter.fromJson(Map<String, dynamic> json) {
    return Spliter(
      spliterId: json["spliter_id"] ?? 0,
      spliterName: json["spliter_name"] ?? "-",
      latitude: json["lantitude"] ?? 0,
      longitude: json["longitude"] ?? 0,
    );
  }
}
