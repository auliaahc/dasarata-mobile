class ResponseFindProspectCustomerModel {
  final bool success;
  final dynamic message;
  final Data? data;
  ResponseFindProspectCustomerModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory ResponseFindProspectCustomerModel.fromJson(Map<String, dynamic> json) {
    return ResponseFindProspectCustomerModel(
      success: json["success"],
      message: json["message"],
      data: Data.fromJson(json["data"]),
    );
  }
}

class Data {
  final int id;
  final int nipSalesId;
  final int prospectCategoryId;
  final int prospectMeetId;
  final String name;
  final String phoneNumber;
  final String installedAddress;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  Data({
    required this.id,
    required this.nipSalesId,
    required this.prospectCategoryId,
    required this.prospectMeetId,
    required this.name,
    required this.phoneNumber,
    required this.installedAddress,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      nipSalesId: json["nip_sales_id"],
      prospectCategoryId: json["prospect_category_id"],
      prospectMeetId: json["prospect_meet_id"],
      name: json["name"],
      phoneNumber: json["phone_number"],
      installedAddress: json["installed_address"],
      status: json["status"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }
}
