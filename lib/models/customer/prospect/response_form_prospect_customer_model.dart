class ResponseFormProspectCustomerModel {
  final bool success;
  final List<String>? errors;
  final String? message;
  ResponseFormProspectCustomerModel({
    required this.success,
    this.errors,
    this.message,
  });

  factory ResponseFormProspectCustomerModel.fromJson(Map<String, dynamic> json) {
    return ResponseFormProspectCustomerModel(
      success: json["success"] ?? false,
      errors: errorsFromJson(json["errors"]),
      message: ""
    );
  }

  static List<String> errorsFromJson(Map<String, dynamic>? errorsJson) {
    if (errorsJson == null) return [];
    return errorsJson.values.expand((error) => List<String>.from(error)).toList();
  }
}
