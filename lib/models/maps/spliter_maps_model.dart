class SpliterMapsModel {
  final String success;
  final String? message;
  final List<Datum>? data;
  SpliterMapsModel({
    required this.success,
    this.data,
    this.message,
  });

  factory SpliterMapsModel.fromJson(Map<String, dynamic> json) {
    return SpliterMapsModel(
      success: json["success"] ?? "",
      message: "",
      data: json["data"] != null
          ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
          : null,
    );
  }
}

class Datum {
  final int id;
  final String area;
  final String spliter;
  final String lat;
  final String lng;
  final int customers;
  Datum({
    required this.id,
    required this.area,
    required this.spliter,
    required this.lat,
    required this.lng,
    required this.customers,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      area: json["area"] ?? "",
      id: json["id"] ?? 0,
      spliter: json["spliter"] ?? "",
      lat: json["lat"] ?? "",
      lng: json["lng"] ?? "",
      customers: json["customers"] ?? 0,
    );
  }
}
