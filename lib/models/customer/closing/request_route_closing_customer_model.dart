class RequestRouteClosingCustomerModel {
  final String? type;
  final double length;
  final String lengthText;
  final List<Point> points;
  RequestRouteClosingCustomerModel({
    this.type = "route",
    required this.length,
    required this.lengthText,
    required this.points,
  });

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "length": length,
      "length_text": lengthText,
      "points": points.map((point) => point.toJson()).toList(),
    };
  }
}

class Point {
  final String lat;
  final String lng;
  Point({
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toJson() {
    return {
      "lat": lat,
      "lng": lng,
    };
  }
}
