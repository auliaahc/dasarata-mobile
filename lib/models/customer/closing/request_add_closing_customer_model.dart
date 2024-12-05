import 'package:image_picker/image_picker.dart';

class RequestAddClosingCustomerModel {
  final String nik;
  final String fullName;
  final String domicileAddress;
  final String dateOfBirth;
  final String gender;
  final int provincesId;
  final int regencyId;
  final int districtId;
  final int villageId;
  final int rt;
  final int rw;
  final String customerCategory;
  final int servicePackageId;
  final int? programId;
  final String installedAddress;
  final XFile photoHome;
  final XFile photoKtp;
  RequestAddClosingCustomerModel({
    required this.nik,
    required this.fullName,
    required this.domicileAddress,
    required this.dateOfBirth,
    required this.gender,
    required this.provincesId,
    required this.regencyId,
    required this.districtId,
    required this.villageId,
    required this.rt,
    required this.rw,
    required this.customerCategory,
    required this.servicePackageId,
    required this.installedAddress,
    required this.photoHome,
    required this.photoKtp,
    this.programId,
  });

  Map<String, dynamic> toJson() {
    return {
      "nik": nik,
      "full_name": fullName,
      "domicile_address": domicileAddress,
      "date_of_birth": dateOfBirth,
      "gender": gender,
      "provinces_id": provincesId,
      "regency_id": regencyId,
      "district_id": districtId,
      "village_id": villageId,
      "rt": rt,
      "rw": rw,
      "customer_category": customerCategory,
      "service_package_id": servicePackageId,
      "program_id": programId,
      "installed_address": installedAddress,
    };
  }
}
