import "dart:convert";

ResponseLoginModel responseLoginModelFromJson(String str) => ResponseLoginModel.fromJson(json.decode(str));
String responseLoginModelToJson(ResponseLoginModel data) => json.encode(data.toJson());

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
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] != null ? Data.fromJson(json["data"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "message": message,
      "data": data?.toJson(),
    };
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

  Map<String, dynamic> toJson() {
    return {
      "token": token,
    };
  }
}
