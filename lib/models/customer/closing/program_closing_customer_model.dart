class ProgramClosingCustomerModel {
  final bool success;
  final String message;
  final List<Datum>? data;
  ProgramClosingCustomerModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory ProgramClosingCustomerModel.fromJson(Map<String, dynamic> json) {
    return ProgramClosingCustomerModel(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] != null ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))) : null,
    );
  }
}

class Datum {
  final int id;
  final String nameProgram;
  final int amountProgram;
  final String remark;
  final DateTime createdAt;
  final DateTime updatedAt;
  Datum({
    required this.id,
    required this.nameProgram,
    required this.amountProgram,
    required this.remark,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      nameProgram: json["name_program"],
      amountProgram: json["amount_program"],
      remark: json["remark"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }
}