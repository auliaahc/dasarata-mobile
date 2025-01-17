import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/config/app_route.dart';
import 'package:dasarata_mobile/controllers/main_controller.dart';
import 'package:dasarata_mobile/controllers/prospect_customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dasarata_mobile/models/customer/closing/district_closing_customer_model.dart'
    as district_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/program_closing_customer_model.dart'
    as program_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/province_closing_customer_model.dart'
    as province_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/regency_closing_customer_model.dart'
    as regency_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/request_add_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/service_package_closing_customer_model.dart'
    as service_package_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/village_closing_customer_model.dart'
    as village_closing_customer_model;
import 'package:dasarata_mobile/models/customer/prospect/response_find_prospect_customer_model.dart'
    as find_prospect_customer_model;
import 'package:dasarata_mobile/models/response_global_model.dart';
import 'package:dasarata_mobile/services/closing_customer_service.dart';
import 'package:dasarata_mobile/services/prospect_customer_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';

class AddClosingCustomerController extends GetxController {
  ClosingCustomerService closingCustomerService = ClosingCustomerService();
  ProspectCustomerService prospectCustomerService = ProspectCustomerService();
  final MainController mainController = Get.find();
  final ProspectCustomerController prospectCustomerController = Get.put(ProspectCustomerController());
  RxInt selectedStepperIndex = RxInt(0);
  final addClosingCustomerFormKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  RxBool isLoadingProspectCustomerData = RxBool(false);
  Rxn<List<service_package_closing_customer_model.Datum>> servicePackagesData = Rxn<List<service_package_closing_customer_model.Datum>>();
  Rxn<List<program_closing_customer_model.Datum>> programsData = Rxn<List<program_closing_customer_model.Datum>>();
  Rxn<find_prospect_customer_model.Data> prospectCustomerData = Rxn<find_prospect_customer_model.Data>();
  RxnString customerType = RxnString();
  RxnString gender = RxnString();
  RxnString servicePackage = RxnString();
  RxnString program = RxnString();
  TextEditingController nameProspect = TextEditingController();
  TextEditingController installedAddress = TextEditingController();
  TextEditingController nik = TextEditingController();
  TextEditingController fullName = TextEditingController();
  RxnString birthDate = RxnString();
  TextEditingController fullAddress = TextEditingController();
  TextEditingController rt = TextEditingController();
  TextEditingController rw = TextEditingController();
  Rxn<List<province_closing_customer_model.Datum>> provincesData = Rxn<List<province_closing_customer_model.Datum>>();
  Rxn<List<regency_closing_customer_model.Datum>> regenciesData = Rxn<List<regency_closing_customer_model.Datum>>();
  Rxn<List<district_closing_customer_model.Datum>> districtsData = Rxn<List<district_closing_customer_model.Datum>>();
  Rxn<List<village_closing_customer_model.Datum>> villagesData = Rxn<List<village_closing_customer_model.Datum>>();
  RxnString province = RxnString();
  RxnString regency = RxnString();
  RxnString district = RxnString();
  RxnString village = RxnString();
  Rxn<XFile> homePhoto = Rxn<XFile>();
  Rxn<XFile> ktpPhoto = Rxn<XFile>();
  TextEditingController birthDateController = TextEditingController();
  RxBool isFormAddClosingCustomerValid = RxBool(false);
  RxBool isLoadingAddClosingCustomer = RxBool(false);

  void validateFormAddClosingCustomer() {
    isFormAddClosingCustomerValid.value = nameProspect.text.isNotEmpty &&
        customerType.value != null &&
        servicePackage.value != null &&
        installedAddress.text.isNotEmpty &&
        homePhoto.value != null &&
        nik.text.isNotEmpty &&
        fullName.text.isNotEmpty &&
        gender.value != null &&
        birthDate.value != null &&
        fullAddress.text.isNotEmpty &&
        province.value != null &&
        regency.value != null &&
        district.value != null &&
        village.value != null &&
        rt.text.isNotEmpty &&
        rw.text.isNotEmpty &&
        ktpPhoto.value != null;
  }

  Future<void> submitAddClosingCustomer() async {
    if (addClosingCustomerFormKeys[1].currentState!.validate()) {
      isLoadingAddClosingCustomer.value = true;
      final data = RequestAddClosingCustomerModel(
        programId: int.tryParse(program.value ?? ""),
        nik: nik.text,
        fullName: fullName.text,
        domicileAddress: fullAddress.text,
        installedAddress: installedAddress.text,
        dateOfBirth: birthDate.value!,
        gender: gender.value!,
        provincesId: int.parse(province.value!),
        regencyId: int.parse(regency.value!),
        districtId: int.parse(district.value!),
        villageId: int.parse(village.value!),
        rt: int.parse(rt.text),
        rw: int.parse(rw.text),
        customerCategory: customerType.value!,
        servicePackageId: int.parse(servicePackage.value!),
        photoHome: homePhoto.value!,
        photoKtp: ktpPhoto.value!,
      );
      try {
        final response = await closingCustomerService.createClosingCustomer(
          model: data,
          prospectCustomerId: prospectCustomerData.value!.id,
        );
        SnackbarUtils.show(
          messageText: response.message,
          type: AnimatedSnackBarType.success,
        );
        prospectCustomerController.resetDashboardProspectCustomer();
        mainController.selectedIndex.value = 1;
        Get.offAllNamed(AppRoute.home);
      } catch (e) {
        if (e is ResponseGlobalModel) {
          SnackbarUtils.show(
            messageText: e.message,
            type: AnimatedSnackBarType.error,
          );
        }
      } finally {
        isLoadingAddClosingCustomer.value = false;
      }
    } else {
      SnackbarUtils.show(
        messageText: "Terdapat kesalahan, silakan periksa kembali formulir",
        type: AnimatedSnackBarType.error,
      );
    }
  }

  void fetchInitialData(int customerId) {
    getProspectCustomerData(customerId);
    getServicePackagesData();
    getProgramsData();
    getProvincesData();
  }

  Future<void> getProspectCustomerData(int customerId) async {
    isLoadingProspectCustomerData.value = true;
    try {
      final response =
          await prospectCustomerService.getProspectCustomer(customerId);
      prospectCustomerData.value = response.data;
      nameProspect.text = prospectCustomerData.value!.name;
      installedAddress.text = prospectCustomerData.value!.installedAddress;
    } catch (e) {
      if (e is find_prospect_customer_model.ResponseFindProspectCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      isLoadingProspectCustomerData.value = false;
    }
  }

  Future<void> getServicePackagesData() async {
    try {
      final response = await closingCustomerService.getServicePackages();
      servicePackagesData.value = response.data;
    } catch (e) {
      if (e is service_package_closing_customer_model
          .ServicePackageClosingCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    }
  }

  Future<void> getProgramsData() async {
    try {
      final response = await closingCustomerService.getPrograms();
      programsData.value = response.data;
    } catch (e) {
      if (e is program_closing_customer_model.ProgramClosingCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    }
  }

  Future<void> getProvincesData() async {
    regenciesData.value = null;
    regency.value = null;
    districtsData.value = null;
    district.value = null;
    villagesData.value = null;
    village.value = null;
    try {
      final response = await closingCustomerService.getProvinces();
      provincesData.value = response.data;
    } catch (e) {
      if (e is province_closing_customer_model.ProvinceClosingCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    }
  }

  Future<void> getRegenciesData(String provinceId) async {
    districtsData.value = [];
    district.value = null;
    villagesData.value = [];
    village.value = null;
    regency.value = null;
    province.value = provinceId;
    final id = int.tryParse(province.value!);
    try {
      final response = await closingCustomerService.getRegencies(id!);
      regenciesData.value = response.data;
    } catch (e) {
      if (e is regency_closing_customer_model.RegencyClosingCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    }
  }

  Future<void> getDistrictsData(String regencyId) async {
    villagesData.value = null;
    village.value = null;
    district.value = null;
    regency.value = regencyId;
    final id = int.tryParse(regency.value!);
    try {
      final response = await closingCustomerService.getDistricts(id!);
      districtsData.value = response.data;
    } catch (e) {
      if (e is district_closing_customer_model.DistrictClosingCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    }
  }

  Future<void> getVillagesData(String districtId) async {
    village.value = null;
    district.value = districtId;
    final id = int.tryParse(district.value!);
    try {
      final response = await closingCustomerService.getVillages(id!);
      villagesData.value = response.data;
    } catch (e) {
      if (e is village_closing_customer_model.VillageClosingCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    }
  }
}

