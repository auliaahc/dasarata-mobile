import 'package:dasarata_mobile/constants/shadow_constant.dart';
import 'package:dasarata_mobile/screens/customer/closing/route/widgets/header/appbar_header_route_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/route/widgets/header/distance_header_route_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/route/widgets/header/type_toggle_header_route_closing_customer_widget.dart';
import 'package:flutter/material.dart';

class HeaderRouteClosingCustomerWidget extends StatelessWidget {
  const HeaderRouteClosingCustomerWidget({super.key});

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
              AppbarHeaderRouteClosingCustomerWidget(),
              DistanceHeaderRouteClosingCustomerWidget()
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: TypeToggleHeaderRouteClosingCustomerWidget(),
        )
      ],
    );
  }
}
