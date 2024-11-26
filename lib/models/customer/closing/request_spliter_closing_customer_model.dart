class RequestSpliterClosingCustomerModel {
  final String? type;
  final int spliterId;
  final int coverageAreaId;
  RequestSpliterClosingCustomerModel({
    this.type = "spliter",
    required this.spliterId,
    required this.coverageAreaId,
  });

  Map<String, dynamic> toJson() {
    return {
      "spliter_id": spliterId,
      "coverage_area_id": coverageAreaId,
      "type": type,
    };
  }
}
