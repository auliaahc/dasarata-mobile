import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/config/app_route.dart';
import 'package:dasarata_mobile/services/closing_customer_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';
import 'package:get/get.dart';
import 'package:dasarata_mobile/models/customer/closing/response_find_closing_customer_model.dart';

class DetailClosingCustomerController extends GetxController {
  final ClosingCustomerService closingCustomerService = ClosingCustomerService();
  RxBool isLoadingGetClosingCustomer = RxBool(false);
  Rxn<Data> detailClosingCustomer = Rxn<Data>();

  void moveToUpdateStatusPhaseScreen(String phase) {
    if (phase == "Personal" || phase == "Teknis") {
      Get.toNamed(AppRoute.surveyClosingCustomer);
    } else if (phase == "Survei") {
      Get.toNamed(AppRoute.spliterClosingCustomer);
    } else {
      Get.toNamed(AppRoute.routeClosingCustomer);
    }
  }

  Future<void> getClosingCustomerData(int customerId) async {
    detailClosingCustomer.value = null;
    isLoadingGetClosingCustomer.value = true;
    try {
      final response = await closingCustomerService.getClosingCustomer(customerId);
      detailClosingCustomer.value = response.data;
    } catch (e) {
      if (e is ResponseFindClosingCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      isLoadingGetClosingCustomer.value = false;
    }
  }
}