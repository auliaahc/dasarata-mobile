class ResponseGlobalModel {
  final bool success;
  final String message;

  ResponseGlobalModel({
    required this.success,
    required this.message,
  });

  factory ResponseGlobalModel.fromJson(Map<String, dynamic> json) {
    return ResponseGlobalModel(
      success: json["success"],
      message: json["message"],
    );
  }
}
