class ResponseSurveyClosingCustomerModel {
  final bool success;
  final String message;
  final Data? data;

  ResponseSurveyClosingCustomerModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory ResponseSurveyClosingCustomerModel.fromJson(Map<String, dynamic> json) {
    return ResponseSurveyClosingCustomerModel(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: Data.fromJson(json["data"]),
    );
  }
}

class Data {
  final String latitude;
  final String longitude;
  final String phaseStatus;

  Data({
    required this.latitude,
    required this.longitude,
    required this.phaseStatus,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      latitude: json["latitude"] ?? "",
      longitude: json["longitude"] ?? "",
      phaseStatus: json["phase_status"] ?? "",
    );
  }
}