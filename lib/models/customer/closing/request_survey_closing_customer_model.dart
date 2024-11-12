class RequestSurveyClosingCustomerModel {
  final String? type;
  final double latitude;
  final double longitude;
  RequestSurveyClosingCustomerModel({
    this.type = "survei",
    required this.latitude,
    required this.longitude
  });

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}