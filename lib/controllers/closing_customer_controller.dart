import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/models/customer/closing/district_closing_customer_model.dart'
    as district_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/program_closing_customer_model.dart'
    as program_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/province_closing_customer_model.dart'
    as province_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/regency_closing_customer_model.dart'
    as regency_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/response_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/response_find_closing_customer_model.dart'
    as response_find_closing_customer_model;
import 'package:dasarata_mobile/config/app_route.dart';
import 'package:dasarata_mobile/models/customer/closing/service_package_closing_customer_model.dart'
    as service_package_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/village_closing_customer_model.dart'
    as village_closing_customer_model;
import 'package:dasarata_mobile/models/customer/prospect/response_find_prospect_customer_model.dart'
    as find_prospect_customer_model;
import 'package:dasarata_mobile/services/closing_customer_service.dart';
import 'package:dasarata_mobile/services/prospect_customer_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClosingCustomerController extends GetxController {
  ClosingCustomerService closingCustomerService = ClosingCustomerService();

  // Dasboard Customer
  Rxn<Data> listDataConfiguration = Rxn<Data>();
  Rx<List<Datum>> listClosingCustomer = Rx<List<Datum>>([]);
  RxInt currentPageData = RxInt(1);
  RxBool isLoadingFetchDashboardData = RxBool(false);
  RxnString searchQuery = RxnString();

  // Detail
  RxBool isLoadingGetClosingCustomer = RxBool(false);
  Rxn<response_find_closing_customer_model.Data> detailClosingCustomer =
      Rxn<response_find_closing_customer_model.Data>();

  void moveToUpdateStatusPhaseScreen(String phase) {
    if (phase == "Personal" || phase == "Teknis") {
      Get.toNamed(AppRoute.surveyClosingCustomer);
    } else if (phase == "Survei") {
      Get.toNamed(AppRoute.spliterClosingCustomer);
    } else {
      Get.toNamed(AppRoute.routeClosingCustomer);
    }
  }

  Future<void> getAllClosingCustomerData() async {
    isLoadingFetchDashboardData.value = true;
    try {
      final response = await closingCustomerService.getAllClosingCustomer(
        page: currentPageData.value,
        search: searchQuery.value,
      );
      listDataConfiguration.value = response.data;
      listClosingCustomer.value.addAll(response.data!.data!);
    } catch (e) {
      if (e is ResponseClosingCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      isLoadingFetchDashboardData.value = false;
    }
  }

  Future<void> getClosingCustomerData(int closingId) async {
    detailClosingCustomer.value = null;
    isLoadingGetClosingCustomer.value = true;
    try {
      final response =
          await closingCustomerService.getClosingCustomer(closingId);
      detailClosingCustomer.value = response.data;
    } catch (e) {
      if (e is response_find_closing_customer_model
          .ResponseFindClosingCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      isLoadingGetClosingCustomer.value = false;
    }
  }

  void moveToDetailScreen(int closingId) {
    getClosingCustomerData(closingId);
    Get.toNamed(AppRoute.detailClosingCustomer);
  }

  void onEndOfPage() {
    if (currentPageData.value != listDataConfiguration.value!.lastPage) {
      currentPageData.value += 1;
      getAllClosingCustomerData();
    }
  }

  void resetDashboardClosingCustomer() {
    searchQuery.value = null;
    currentPageData.value = 1;
    listDataConfiguration.value = null; // TODO checkpoint
    listClosingCustomer.value.clear();
    getAllClosingCustomerData();
  }

  void doSearchClosingCustomer(String query) {
    searchQuery.value = query;
    if (searchQuery.value != null) {
      currentPageData.value = 1;
      listClosingCustomer.value.clear();
      getAllClosingCustomerData();
    }
  }

  // Add Closing Customer Methods
  ProspectCustomerService prospectCustomerService = ProspectCustomerService();
  RxInt selectedStepperIndex = RxInt(0);
  final addClosingCustomerFormKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  Rxn<List<service_package_closing_customer_model.Datum>> servicePackagesData =
      Rxn<List<service_package_closing_customer_model.Datum>>();
  Rxn<List<program_closing_customer_model.Datum>> programsData =
      Rxn<List<program_closing_customer_model.Datum>>();
  Rxn<find_prospect_customer_model.Data> prospectCustomerData =
      Rxn<find_prospect_customer_model.Data>();
  RxnString customerType = RxnString();
  RxnString gender = RxnString();
  RxnString servicePackage = RxnString();
  RxnString program = RxnString();
  TextEditingController nameProspectController = TextEditingController();
  TextEditingController installedAddressController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  RxnString birthDate = RxnString();
  TextEditingController fullAddressController = TextEditingController();
  TextEditingController rtController = TextEditingController();
  TextEditingController rwController = TextEditingController();
  Rxn<List<province_closing_customer_model.Datum>> provincesData =
      Rxn<List<province_closing_customer_model.Datum>>();
  Rxn<List<regency_closing_customer_model.Datum>> regenciesData =
      Rxn<List<regency_closing_customer_model.Datum>>();
  Rxn<List<district_closing_customer_model.Datum>> districtsData =
      Rxn<List<district_closing_customer_model.Datum>>();
  Rxn<List<village_closing_customer_model.Datum>> villagesData =
      Rxn<List<village_closing_customer_model.Datum>>();
  RxnString province = RxnString();
  RxnString regency = RxnString();
  RxnString district = RxnString();
  RxnString village = RxnString();

  void fetchAddClosingCustomerData() {
    getServicePackagesData();
    getProgramsData();
    getProvincesData();
  }

  Future<void> getProspectCustomerData(int id) async {
    try {
      final response = await prospectCustomerService.getProspectCustomer(id);
      prospectCustomerData.value = response.data;
      nameProspectController.text = prospectCustomerData.value!.name;
      installedAddressController.text =
          prospectCustomerData.value!.installedAddress;
    } catch (e) {
      if (e is find_prospect_customer_model.ResponseFindProspectCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
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
