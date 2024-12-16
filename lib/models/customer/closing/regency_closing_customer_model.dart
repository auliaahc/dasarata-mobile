class RegencyClosingCustomerModel {
  final bool success;
  final dynamic message;
  final List<Datum>? data;
  RegencyClosingCustomerModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory RegencyClosingCustomerModel.fromJson(Map<String, dynamic> json) {
    return RegencyClosingCustomerModel(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  final int id;
  final int provinceId;
  final String name;
  Datum({
    required this.id,
    required this.provinceId,
    required this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      provinceId: json["province_id"],
      name: json["name"],
    );
  }
}
