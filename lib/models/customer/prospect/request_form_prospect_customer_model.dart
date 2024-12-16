class RequestFormProspectCustomerModel {
  final String nipSalesId;
  final int prospectCategoryId;
  final int prospectMeetId;
  final String name;
  final String phoneNumber;
  final String installedAddress;
  final String status;
  RequestFormProspectCustomerModel({
    required this.nipSalesId,
    required this.prospectCategoryId,
    required this.prospectMeetId,
    required this.name,
    required this.phoneNumber,
    required this.installedAddress,
    this.status = "prospect",
  });

  factory RequestFormProspectCustomerModel.fromJson(Map<String, dynamic> json) {
    return RequestFormProspectCustomerModel(
      nipSalesId: json["nip_sales_id"],
      prospectCategoryId: json["prospect_category_id"],
      prospectMeetId: json["prospect_meet_id"],
      name: json["name"],
      phoneNumber: json["phone_number"],
      installedAddress: json["installed_address"],
      status: "prospect",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nip_sales_id": nipSalesId,
      "prospect_category_id": prospectCategoryId,
      "prospect_meet_id": prospectMeetId,
      "name": name,
      "phone_number": phoneNumber,
      "installed_address": installedAddress,
      "status": "prospect",
    };
  }
}
