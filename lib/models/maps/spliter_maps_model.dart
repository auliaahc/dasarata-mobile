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
  final double lat;
  final double lng;
  final int customers;
  final int coverageAreaId;
  Datum({
    required this.id,
    required this.area,
    required this.spliter,
    required this.lat,
    required this.lng,
    required this.customers,
    required this.coverageAreaId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      area: json["area"] ?? "",
      id: json["id"] ?? 0,
      spliter: json["spliter"] ?? "",
      lat: json["lat"] ?? 0,
      lng: json["lng"] ?? 0,
      customers: json["customers"] ?? 0,
      coverageAreaId: json["coverage_area_id"] ?? 0,
    );
  }
}
