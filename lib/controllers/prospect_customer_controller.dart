import 'dart:async';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dasarata_mobile/models/customer/prospect/response_prospect_customer_model.dart';
import 'package:dasarata_mobile/screens/customer/prospect/dashboard/widgets/detail_dialog_dashboard_prospect_customer_widget.dart';
import 'package:dasarata_mobile/services/prospect_customer_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';

class ProspectCustomerController extends GetxController {
  ProspectCustomerService prospectCustomerService = ProspectCustomerService();
  RxnString searchProspectCustomerQuery = RxnString();
  Rx<List<Datum>> listProspectCustomer = Rx<List<Datum>>([]);
  RxInt currentPageData = RxInt(1);
  Rxn<Data> listDataConfiguration = Rxn<Data>();
  RxBool isLoadingListProspectCustomer = RxBool(false);

  void resetDashboardProspectCustomer() {
    searchProspectCustomerQuery.value = null;
    currentPageData.value = 1;
    listProspectCustomer.value.clear();
    getAllProspectCustomerData();
  }

  void onEndOfPage() {
    if (currentPageData.value != listDataConfiguration.value!.lastPage) {
      currentPageData.value += 1;
      getAllProspectCustomerData();
    }
  }

  void searchProspectCustomer(String query) {
    searchProspectCustomerQuery.value = query;
    listProspectCustomer.value.clear();
    currentPageData.value = 1;
    getAllProspectCustomerData();
  }

  Future<void> getAllProspectCustomerData() async {
    isLoadingListProspectCustomer.value = true;
    try {
      final response = await prospectCustomerService.getAllProspectCustomer(
        search: searchProspectCustomerQuery.value,
        page: currentPageData.value,
      );
      listDataConfiguration.value = response.data;
      listProspectCustomer.value.addAll(response.data!.data!);
    } catch (e) {
      if (e is ResponseProspectCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      isLoadingListProspectCustomer.value = false;
    }
  }

  void showDetailDialog(Datum data) {
    Get.dialog(
      DetailDialogDashboardProspectCustomerWidget(
        id: data.id,
        name: data.name,
        telephoneNumber: data.phone,
        meetMethod: data.meetCategory,
        status: data.prospectCategory,
        address: data.installedAddress,
      ),
    );
  }

  void launchWhatsapp(String telephoneNumber) async {
    String url = "https://api.whatsapp.com/send/?phone=$telephoneNumber";
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      SnackbarUtils.show(
        messageText: e.toString(),
        type: AnimatedSnackBarType.error,
      );
    }
  }
}