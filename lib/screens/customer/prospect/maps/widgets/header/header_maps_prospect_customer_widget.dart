import 'package:dasarata_mobile/constants/shadow_constant.dart';
import 'package:dasarata_mobile/screens/customer/prospect/maps/widgets/header/appbar_header_maps_prospect_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/prospect/maps/widgets/header/search_header_maps_prospect_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/prospect/maps/widgets/header/type_toggle_header_maps_prospect_customer_widget.dart';
import 'package:flutter/material.dart';

class HeaderMapsProspectCustomerWidget extends StatelessWidget {
  const HeaderMapsProspectCustomerWidget({super.key});

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
              AppbarHeaderMapsProspectCustomerWidget(),
              SearchHeaderMapsProspectCustomerWidget(),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
            top: 24,
          ),
          child: TypeToggleHeaderMapsProspectCustomerWidget(),
        )
      ],
    );
  }
}
