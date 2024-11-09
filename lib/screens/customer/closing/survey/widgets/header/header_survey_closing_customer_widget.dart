import 'package:dasarata_mobile/constants/shadow_constant.dart';
import 'package:dasarata_mobile/screens/customer/closing/survey/widgets/header/appbar_header_survey_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/survey/widgets/header/search_header_survey_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/survey/widgets/header/type_toggle_header_survey_closing_customer_widget.dart';
import 'package:flutter/material.dart';

class HeaderHomePointClosingCustomerWidget extends StatelessWidget {
  const HeaderHomePointClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: ShadowConstant.appbarShadow,
          ),
          child: const Column(
            children: [
              AppbarHeaderHomePointClosingCustomerWidget(),
              SearchHeaderHomePointClosingCustomerWidget(),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
            top: 24,
          ),
          child: TypeToggleHeaderHomePointClosingCustomerWidget(),
        )
      ],
    );
  }
}
