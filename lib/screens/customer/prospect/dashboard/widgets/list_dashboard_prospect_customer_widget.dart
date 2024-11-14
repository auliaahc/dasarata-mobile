import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/prospect_customer_controller.dart';
import 'package:dasarata_mobile/screens/customer/prospect/dashboard/widgets/add_floating_button_dashboard_prospect_customer_widget.dart';
import 'package:dasarata_mobile/widgets/empty_state_global_widget.dart';
import 'package:dasarata_mobile/widgets/item_customer_global_widget.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ListDashboardProspectCustomerWidget extends StatelessWidget {
  const ListDashboardProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProspectCustomerController prospectCustomerController = Get.put(ProspectCustomerController());
    Get.engine.addPostFrameCallback((_) {
      prospectCustomerController.resetDashboardProspectCustomer();
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.backgroundColor,
      floatingActionButton: const AddFloatingButtonDashboardProspectCustomerWidget(),
      body: Column(
        children: [
          Obx(
            () {
              if (prospectCustomerController.isLoadingListProspectCustomer.value && prospectCustomerController.listProspectCustomer.value.isEmpty) {
                return const Expanded(
                  child: Center(
                    child: LoadingAnimationGlobalWidget(),
                  ),
                );
              } else if (prospectCustomerController.listDataConfiguration.value == null || prospectCustomerController.listProspectCustomer.value.isEmpty) {
                return Expanded(
                  child: Center(
                    child: EmptyStateGlobalWidget(
                      additionalSpacing: SpacingConstant.verticalSpacing80px,
                    ),
                  ),
                );
              } else {
                return Expanded(
                  child: LazyLoadScrollView(
                    onEndOfPage: () => prospectCustomerController.onEndOfPage(),
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      itemCount: prospectCustomerController.listDataConfiguration.value!.to + (prospectCustomerController.isLoadingListProspectCustomer.value ? 1 : 0),
                      separatorBuilder: (context, index) => SpacingConstant.verticalSpacing16px,
                      itemBuilder: (context, index) {
                        if (index == (prospectCustomerController.listDataConfiguration.value!.to) && prospectCustomerController.isLoadingListProspectCustomer.value) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: LoadingAnimationGlobalWidget(
                              size: 30,
                            ),
                          );
                        } else {
                          final customer = prospectCustomerController.listProspectCustomer.value[index];
                          return ItemCustomerGlobalWidget(
                            onTap: () => prospectCustomerController.showDetailDialog(customer),
                            index: index,
                            name: customer.name,
                            address: customer.installedAddress,
                            telephoneNumber: customer.phone,
                            status: customer.prospectCategory,
                          );
                        }
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
