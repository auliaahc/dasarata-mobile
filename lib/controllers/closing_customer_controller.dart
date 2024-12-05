import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/config/app_route.dart';
import 'package:get/get.dart';
import 'package:dasarata_mobile/models/customer/closing/response_closing_customer_model.dart';
import 'package:dasarata_mobile/services/closing_customer_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';

class ClosingCustomerController extends GetxController {
  ClosingCustomerService closingCustomerService = ClosingCustomerService();
  Rxn<Data> listDataConfiguration = Rxn<Data>();
  Rx<List<Datum>> listClosingCustomer = Rx<List<Datum>>([]);
  RxInt currentPageData = RxInt(1);
  RxBool isLoadingFetchDashboardData = RxBool(false);
  RxnString searchQuery = RxnString();
  RxnInt selectedCustomerId = RxnInt();
  RxBool isLoadingFetchClosingCustomer = RxBool(false);

  void goToDetail(int customerId) {
    selectedCustomerId.value = customerId;
    Get.toNamed(AppRoute.detailClosingCustomer);
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

  void onEndOfPage() {
    if (currentPageData.value != listDataConfiguration.value!.lastPage) {
      currentPageData.value += 1;
      getAllClosingCustomerData();
    }
  }

  void resetDashboardClosingCustomer() {
    searchQuery.value = null;
    currentPageData.value = 1;
    listDataConfiguration.value = null;
    listClosingCustomer.value.clear();
    getAllClosingCustomerData();
  }

  void searchClosingCustomer(String query) {
    searchQuery.value = query;
    if (searchQuery.value != null) {
      currentPageData.value = 1;
      listClosingCustomer.value.clear();
      getAllClosingCustomerData();
    }
  }
}
