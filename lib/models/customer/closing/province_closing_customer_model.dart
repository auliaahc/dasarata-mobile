class ProvinceClosingCustomerModel {
  final bool success;
  final dynamic message;
  final List<Datum>? data;
  ProvinceClosingCustomerModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory ProvinceClosingCustomerModel.fromJson(Map<String, dynamic> json) {
    return ProvinceClosingCustomerModel(
      success: json["success"],
      message: json["message"],
      data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  final int id;
  final String name;
  Datum({
    required this.id,
    required this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      name: json["name"],
    );
  }
}
