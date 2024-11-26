import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/screens/customer/closing/add/widgets/customer_form_add_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/add/widgets/ktp_form_add_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/add/widgets/submit_button_add_closing_customer_widget.dart';
import 'package:dasarata_mobile/widgets/appbar_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddClosingCustomerScreen extends StatelessWidget {
  const AddClosingCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ClosingCustomerController closingCustomerController =
        Get.put(ClosingCustomerController());
    Get.engine.addPostFrameCallback((_) {
      closingCustomerController.fetchAddClosingCustomerData();
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.whiteColor,
      appBar: const AppbarGlobalWidget(
        title: "Tambah Customer Closing",
        implyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomerFormAddClosingCustomerWidget(),
                  SpacingConstant.verticalSpacing16px,
                  const KtpFormAddClosingCustomerWidget(),
                ],
              ),
            ),
            const SubmitButtonAddClosingCustomerWidget(),
          ],
        ),
      ),
    );
  }
}
