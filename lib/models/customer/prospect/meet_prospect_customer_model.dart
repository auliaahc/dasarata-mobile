class MeetProspectCustomerModel {
  final bool success;
  final String message;
  final List<Datum>? data;
  MeetProspectCustomerModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory MeetProspectCustomerModel.fromJson(Map<String, dynamic> json) {
    return MeetProspectCustomerModel(
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
  final String meetCategory;
  final DateTime createdAt;
  final DateTime updatedAt;
  Datum({
    required this.id,
    required this.meetCategory,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"] ?? 0,
      meetCategory: json["meet_category"] ?? "",
      createdAt: DateTime.parse(json["created_at"] as String),
      updatedAt: DateTime.parse(json["updated_at"] as String),
    );
  }
}
