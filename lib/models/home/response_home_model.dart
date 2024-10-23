import 'dart:convert';

ResponseHomeModel responseHomeModelFromJson(String str) => ResponseHomeModel.fromJson(json.decode(str));
String responseHomeModelToJson(ResponseHomeModel data) => json.encode(data.toJson());

class ResponseHomeModel {
  final bool success;
  final String message;
  final ResponseHomeModelData? data;
  ResponseHomeModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory ResponseHomeModel.fromJson(Map<String, dynamic> json) {
    return ResponseHomeModel(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] != null ? ResponseHomeModelData.fromJson(json["data"]) : null,
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

class ResponseHomeModelData {
  final Data data;
  final String status;
  ResponseHomeModelData({
    required this.data,
    required this.status,
  });

  factory ResponseHomeModelData.fromJson(Map<String, dynamic> json) {
    return ResponseHomeModelData(
      data: Data.fromJson(json["data"]),
      status: json["status"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": data.toJson(),
      "status": status,
    };
  }
}

class Data {
  final int countClosing;
  final int countProspect;
  final List<GrowthProspect> growthProspect;
  final List<GrowthClosing> growthClosing;
  Data({
    required this.countClosing,
    required this.countProspect,
    required this.growthProspect,
    required this.growthClosing,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      countClosing: json["countClosing"] ?? 0,
      countProspect: json["countProspect"] ?? 0,
      growthProspect: (json["growthProspect"] as List<dynamic>?)
              ?.map((item) => GrowthProspect.fromJson(item))
              .toList() ?? [],
      growthClosing: (json["growthClosing"] as List<dynamic>?)
              ?.map((item) => GrowthClosing.fromJson(item))
              .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "countClosing": countClosing,
      "countProspect": countProspect,
      "growthProspect": growthProspect.map((e) => e.toJson()).toList(),
      "growthClosing": growthClosing.map((e) => e.toJson()).toList(),
    };
  }
}

class GrowthProspect {
  final int total;
  final String monthName;
  final int year;
  GrowthProspect({
    required this.total,
    required this.monthName,
    required this.year,
  });

  factory GrowthProspect.fromJson(Map<String, dynamic> json) {
    return GrowthProspect(
      total: json["total"] ?? 0,
      monthName: json["month_name"] ?? "",
      year: json["year"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "total": total,
      "month_name": monthName,
      "year": year,
    };
  }
}

class GrowthClosing {
  final int total;
  final String monthName;
  final int year;
  GrowthClosing({
    required this.total,
    required this.monthName,
    required this.year,
  });

  factory GrowthClosing.fromJson(Map<String, dynamic> json) {
    return GrowthClosing(
      total: json["total"] ?? 0,
      monthName: json["month_name"] ?? "",
      year: json["year"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "total": total,
      "month_name": monthName,
      "year": year,
    };
  }
}
