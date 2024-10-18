import "dart:convert";

RequestLoginModel requestLoginModelFromJson(String str) => RequestLoginModel.fromJson(json.decode(str));
String requestLoginModelToJson(RequestLoginModel data) => json.encode(data.toJson());

class RequestLoginModel {
  final String email;
  final String password;
  RequestLoginModel({
    required this.email,
    required this.password,
  });

  factory RequestLoginModel.fromJson(Map<String, dynamic> json) {
    return RequestLoginModel(
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
