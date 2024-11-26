class DashboardModel {
  final bool success;
  final String message;
  final DashboardModelData? data;
  DashboardModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] != null ? DashboardModelData.fromJson(json["data"]) : null,
    );
  }
}

class DashboardModelData {
  final Data data;
  final String status;
  DashboardModelData({
    required this.data,
    required this.status,
  });

  factory DashboardModelData.fromJson(Map<String, dynamic> json) {
    return DashboardModelData(
      data: Data.fromJson(json["data"]),
      status: json["status"] ?? "",
    );
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

}
