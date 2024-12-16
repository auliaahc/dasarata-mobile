import 'package:dasarata_mobile/constants/shadow_constant.dart';
import 'package:dasarata_mobile/screens/customer/closing/spliter/widgets/header/appbar_header_spliter_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/spliter/widgets/header/detail_header_spliter_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/spliter/widgets/header/type_toggle_header_spliter_closing_customer_widget.dart';
import 'package:flutter/material.dart';

class HeaderSpliterClosingCustomerWidget extends StatelessWidget {
  const HeaderSpliterClosingCustomerWidget({super.key});

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
              AppbarHeaderSpliterClosingCustomerWidget(),
              DetailHeaderSpliterClosingCustomerWidget(),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
            top: 24,
          ),
          child: TypeToggleHeaderSpliterClosingCustomerWidget(),
        )
      ],
    );
  }
}
