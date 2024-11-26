import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/prospect_customer_controller.dart';
import 'package:dasarata_mobile/screens/customer/prospect/maps/widgets/footer/current_location_floating_button_maps_prospect_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/prospect/maps/widgets/footer/detail_footer_maps_prospect_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/prospect/maps/widgets/footer/next_button_footer_maps_prospect_customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooterMapsProspectCustomerWidget extends StatelessWidget {
  const FooterMapsProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProspectCustomerController prospectCustomerController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () {
          return Column(
            children: [
              if (prospectCustomerController.currentLatLng.value != null)
                const CurrentLocationFloatingButtonMapsProspectCustomerWidget(),
              if (prospectCustomerController.currentAddress.value != null &&
                  !prospectCustomerController.isLoadingGetAddress.value) ...[
                SpacingConstant.verticalSpacing16px,
                const DetailFooterMapsProspectCustomerWidget(),
              ],
              SpacingConstant.verticalSpacing24px,
              const NextButtonFooterMapsProspectCustomerWidget()
            ],
          );
        },
      ),
    );
  }
}
