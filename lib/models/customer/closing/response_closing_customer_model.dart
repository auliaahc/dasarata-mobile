class ResponseClosingCustomerModel {
  final bool success;
  final String message;
  final Data? data;

  ResponseClosingCustomerModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory ResponseClosingCustomerModel.fromJson(Map<String, dynamic> json) {
    return ResponseClosingCustomerModel(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: Data.fromJson(json["data"]),
    );
  }
}

class Data {
  final int currentPage;
  final List<Datum>? data;
  final int lastPage;
  final int perPage;
  final int to;

  Data({
    required this.currentPage,
    this.data,
    required this.lastPage,
    required this.perPage,
    required this.to,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      data: json["data"] != null
          ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
          : null,
      currentPage: json["current_page"] ?? 1,
      lastPage: json["last_page"] ?? 1,
      perPage: json["per_page"] ?? 1,
      to: json["to"] ?? 1,
    );
  }
}

class Datum {
  final int id;
  final int prospectCustomerId;
  final String nik;
  final String fullName;
  final String installedAddress;
  final String phaseStatus;
  // final String phoneNumber;

  Datum({
    required this.id,
    required this.nik,
    required this.prospectCustomerId,
    required this.fullName,
    required this.installedAddress,
    required this.phaseStatus,
    // required this.phoneNumber,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"] ?? 0,
      nik: json["nik"] ?? "",
      prospectCustomerId: json["prospect_customer_id"] ?? 0,
      fullName: json["full_name"] ?? "",
      installedAddress: json["installed_address"] ?? "",
      phaseStatus: json["phase_status"] ?? "",
      // phoneNumber: json["phone_number"] ?? "",
    );
  }
}
