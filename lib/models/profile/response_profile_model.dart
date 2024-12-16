class ResponseProfileModel {
  final bool success;
  final String message;
  final Data? data;
  ResponseProfileModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory ResponseProfileModel.fromJson(Map<String, dynamic> json) {
    return ResponseProfileModel(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] != null ? Data.fromJson(json["data"]) : null,
    );
  }
}

class Data {
  final int id;
  final String nip;
  final String name;
  final String division;
  final String email;
  final String address;
  final String phone;
  final String photo;

  Data({
    required this.id,
    required this.nip,
    required this.name,
    required this.division,
    required this.email,
    required this.address,
    required this.phone,
    required this.photo,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      address: json["address"] ?? "",
      id: json["id"] ?? 0,
      nip: json["nip"] ?? "",
      name: json["name"] ?? "",
      division: json["division"]["name"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      photo: json["photo"] ?? "",
    );
  }
}
