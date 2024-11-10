import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/screens/customer/closing/route/widgets/footer/accurate_camera_footer_route_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/route/widgets/footer/submit_button_footer_route_closing_customer_widget.dart';
import 'package:flutter/material.dart';

class FooterRouteClosingCustomerWidget extends StatelessWidget {
  const FooterRouteClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const AccurateCameraFooterRouteClosingCustomerWidget(),
          SpacingConstant.verticalSpacing24px,
          const SubmitButtonFooterRouteClosingCustomerWidget()
        ],
      ),
    );
  }
}
