import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/screens/customer/closing/home_point/widgets/footer/current_location_footer_floating_button_home_point_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/home_point/widgets/footer/submit_button_footer_home_point_closing_customer_widget.dart';
import 'package:flutter/material.dart';

class FooterHomePointClosingCustomerWidget extends StatelessWidget {
  const FooterHomePointClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const CurrentLocationFloatingButtonFooterHomePointClosingCustomerWidget(),
          SpacingConstant.verticalSpacing24px,
          const SubmitButtonFooterHomePointClosingCustomerWidget()
        ],
      ),
    );
  }
}
