class DistrictClosingCustomerModel {
  final bool success;
  final dynamic message;
  final List<Datum>? data;
  DistrictClosingCustomerModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory DistrictClosingCustomerModel.fromJson(Map<String, dynamic> json) {
    return DistrictClosingCustomerModel(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  final int id;
  final int regencyId;
  final String name;
  Datum({
    required this.id,
    required this.regencyId,
    required this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      regencyId: json["regency_id"],
      name: json["name"],
    );
  }
}
