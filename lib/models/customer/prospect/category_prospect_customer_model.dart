class CategoryProspectCustomerModel {
  final bool success;
  final String message;
  final List<Datum>? data;
  CategoryProspectCustomerModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory CategoryProspectCustomerModel.fromJson(Map<String, dynamic> json) {
    return CategoryProspectCustomerModel(
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
  final String nameCategory;
  final DateTime createdAt;
  final DateTime updatedAt;
  Datum({
    required this.id,
    required this.nameCategory,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"] ?? 0,
      nameCategory: json["name_category"] ?? "",
      createdAt: DateTime.parse(json["created_at"] as String),
      updatedAt: DateTime.parse(json["updated_at"] as String),
    );
  }
}
