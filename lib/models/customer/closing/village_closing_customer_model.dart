class VillageClosingCustomerModel {
  final bool success;
  final dynamic message;
  final List<Datum>? data;
  VillageClosingCustomerModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory VillageClosingCustomerModel.fromJson(Map<String, dynamic> json) {
    return VillageClosingCustomerModel(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  final int id;
  final int districtId;
  final String name;
  Datum({
    required this.id,
    required this.districtId,
    required this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      districtId: json["district_id"],
      name: json["name"],
    );
  }
}
