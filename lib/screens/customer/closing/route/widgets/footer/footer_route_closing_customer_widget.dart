import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/route_closing_customer_controller.dart';
import 'package:dasarata_mobile/screens/customer/closing/route/widgets/footer/accurate_camera_footer_route_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/route/widgets/footer/submit_button_footer_route_closing_customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooterRouteClosingCustomerWidget extends StatelessWidget {
  const FooterRouteClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    RouteClosingCustomerController routeClosingCustomerController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () {
          return Column(
            children: [
              if (!routeClosingCustomerController
                  .isLoadingGetClosingCustomerData.value) ...[
                const AccurateCameraFooterRouteClosingCustomerWidget(),
                SpacingConstant.verticalSpacing24px,
              ],
              const SubmitButtonFooterRouteClosingCustomerWidget()
            ],
          );
        },
      ),
    );
  }
}
