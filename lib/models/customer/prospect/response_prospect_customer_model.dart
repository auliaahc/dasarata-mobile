class ResponseProspectCustomerModel {
  final bool success;
  final String message;
  final List<Datum>? data;

  ResponseProspectCustomerModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory ResponseProspectCustomerModel.fromJson(Map<String, dynamic> json) {
    return ResponseProspectCustomerModel(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] != null
          ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
          : null,
    );
  }
}

class Datum {
  final int id;
  final String name;
  final String phone;
  final String installedAddress;
  final int sales;
  final String prospectCategory;
  final String meetCategory;
  final String status;

  Datum({
    required this.id,
    required this.name,
    required this.phone,
    required this.installedAddress,
    required this.sales,
    required this.prospectCategory,
    required this.meetCategory,
    required this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      phone: json["phone"] ?? "",
      installedAddress: json["installed_address"] ?? "",
      sales: json["sales"] ?? 0,
      prospectCategory: json["prospect_category"] ?? "",
      meetCategory: json["meet_category"] ?? "",
      status: json["status"] ?? "",
    );
  }
}
