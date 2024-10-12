import 'package:dasarata_mobile/constants/logger_constant.dart';
import 'package:dasarata_mobile/screens/customer/prospect/widgets/detail_dialog_prospect_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/prospect/widgets/list_prospect_customer_widget.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProspectCustomerController extends GetxController {
  // TODO: Ganti data input dari model
  void showDetailDialog() {
    LoggerConstant.error("Ini udah muncul ya sayang dialognya, nanti klo dah integrasi dibenahin lg hehe");
    // Get.dialog(DetailDialogProspectCustomerWidget(
    //   name: name,
    //   telephoneNumber: telephoneNumber,
    //   meetMethod: meetMethod,
    //   status: status,
    //   address: address,
    // ));
  }

  void launchWhatsapp(String telephoneNumber) async {
    String url = "https://api.whatsapp.com/send/?phone=$telephoneNumber";
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      //TODO: Error state / snackbar
    }
  }
}
