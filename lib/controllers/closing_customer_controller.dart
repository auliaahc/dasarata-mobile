import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/constants/logger_constant.dart';
import 'package:dasarata_mobile/models/customer/closing/response_closing_customer_model.dart';
import 'package:dasarata_mobile/services/closing_customer_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';
import 'package:get/get.dart';

class ClosingCustomerController extends GetxController {
  ClosingCustomerService closingCustomerService = ClosingCustomerService();

  // Dasboard Customer
  Rxn<Data> listDataConfiguration = Rxn<Data>();
  Rx<List<Datum>> listClosingCustomer = Rx<List<Datum>>([]);
  RxInt currentPageData = RxInt(1);
  RxBool isLoadingFetchDashboardData = RxBool(false);
  RxnString searchQuery = RxnString();

  Future<void> getAllClosingCustomerData() async {
    isLoadingFetchDashboardData.value = true;
    if (searchQuery.value != null) listClosingCustomer.value.clear();
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
    currentPageData.value = 1;
    listClosingCustomer.value.clear();
    getAllClosingCustomerData();
  }

  void doSearchClosingCustomer(String query) {
    searchQuery.value = query;
    getAllClosingCustomerData();
  }
}
