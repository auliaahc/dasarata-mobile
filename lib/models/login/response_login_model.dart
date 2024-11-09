class ResponseLoginModel {
  final bool success;
  final String message;
  final Data? data;
  ResponseLoginModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory ResponseLoginModel.fromJson(Map<String, dynamic> json) {
    return ResponseLoginModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] != null ? Data.fromJson(json["data"]) : null,
    );
  }
}

class Data {
  final String token;
  Data({
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json["token"],
    );
  }
}
