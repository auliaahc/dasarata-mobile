import 'package:dasarata_mobile/screens/customer/closing/widgets/list_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/prospect/widgets/list_prospect_customer_widget.dart';
import 'package:flutter/material.dart';

class ViewTabBarDashboardCustomerWidget extends StatelessWidget {
  const ViewTabBarDashboardCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(
        children: [
          ListProspectCustomerWidget(),
          ListClosingCustomerWidget(),
        ],
      ),
    );
  }
}