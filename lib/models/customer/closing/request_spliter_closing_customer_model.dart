class RequestSpliterClosingCustomerModel {
  final int spliterId;
  final int coverageAreaId;
  final String? type;
  RequestSpliterClosingCustomerModel({
    required this.spliterId,
    required this.coverageAreaId,
    this.type = "spliter",
  });

  Map<String, dynamic> toJson() {
    return {
      "spliter_id": spliterId,
      "coverage_area_id": coverageAreaId,
      "type": type,
    };
  }
}
