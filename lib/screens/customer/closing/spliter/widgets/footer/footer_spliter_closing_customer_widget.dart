import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/spliter_closing_customer_controller.dart';
import 'package:dasarata_mobile/screens/customer/closing/spliter/widgets/footer/registered_location_footer_spliter_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/spliter/widgets/footer/submit_button_footer_spliter_closing_customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooterSpliterClosingCustomerWidget extends StatelessWidget {
  const FooterSpliterClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SpliterClosingCustomerController spliterClosingCustomerController =
        Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () {
          final bool isLoading =
              spliterClosingCustomerController.isLoadingGetSplitersData.value ||
                  spliterClosingCustomerController
                      .isLoadingGetClosingCustomerData.value;
          return Column(
            children: [
              if (!isLoading) ...[
                const RegisteredLocationFooterSpliterClosingCustomerWidget(),
                SpacingConstant.verticalSpacing24px,
              ],
              const SubmitButtonFooterSpliterClosingCustomerWidget()
            ],
          );
        },
      ),
    );
  }
}
