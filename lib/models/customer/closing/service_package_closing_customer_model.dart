class ServicePackageClosingCustomerModel {
  final bool success;
  final dynamic message;
  final List<Datum>? data;
  ServicePackageClosingCustomerModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory ServicePackageClosingCustomerModel.fromJson(Map<String, dynamic> json) {
    return ServicePackageClosingCustomerModel(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] != null ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))) : null,
    );
  }
}

class Datum {
  final int id;
  final String packageName;
  final String speed;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;
  Datum({
    required this.id,
    required this.packageName,
    required this.speed,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      packageName: json["package_name"],
      speed: json["speed"],
      price: json["price"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }
}
