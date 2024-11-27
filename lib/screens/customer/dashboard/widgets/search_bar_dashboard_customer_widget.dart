import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/controllers/dashboard_customer_controller.dart';
import 'package:dasarata_mobile/controllers/prospect_customer_controller.dart';
import 'package:dasarata_mobile/widgets/text_field_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class SearchBarDashboardCustomerWidget extends StatelessWidget {
  const SearchBarDashboardCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardCustomerController dashboardCustomerController = Get.find();
    final ProspectCustomerController prospectCustomerController = Get.find();
    final ClosingCustomerController closingCustomerController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () {
          return TextFieldGlobalWidget(
            controller: dashboardCustomerController.searchCustomerController,
            icon: LineIcons.search,
            hint: "Search",
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.text,
            suffixIcon: dashboardCustomerController.searchCustomerQuery.value.isNotEmpty
                    ? IconButton(
                        onPressed:
                            dashboardCustomerController.onClearSearchCustomer,
                        icon: Icon(
                          Icons.close,
                          color: ColorConstant.neutralColor600,
                        ),
                      )
                    : null,
            onSubmit: (query) {
              if (dashboardCustomerController.selectedCustomerTabIndex.value == 0) {
                prospectCustomerController.searchProspectCustomer(query);
              } else if (dashboardCustomerController.selectedCustomerTabIndex.value == 1) {
                closingCustomerController.doSearchClosingCustomer(query);
              }
            },
            onChanged: (query) => dashboardCustomerController.searchCustomerQuery.value = query,
          );
        },
      ),
    );
  }
}
