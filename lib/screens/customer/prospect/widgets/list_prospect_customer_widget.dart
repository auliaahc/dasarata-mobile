import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/prospect_customer_controller.dart';
import 'package:dasarata_mobile/screens/customer/prospect/widgets/add_floating_button_prospect_customer_widget.dart';
import 'package:dasarata_mobile/widgets/empty_state_global_widget.dart';
import 'package:dasarata_mobile/widgets/item_customer_global_widget.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProspectCustomerWidget extends StatelessWidget {
  const ListProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProspectCustomerController prospectCustomerController = Get.put(ProspectCustomerController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      prospectCustomerController.getAllProspectCustomerData();
    });
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      floatingActionButton: const AddFloatingButtonProspectCustomerWidget(),
      body: Column(
        children: [
          Obx(
            () {
              if (prospectCustomerController.isLoadingListProspectCustomer.value) {
                return const Expanded(
                  child: Center(
                    child: LoadingAnimationGlobalWidget(),
                  ),
                );
              } else if (!prospectCustomerController.isLoadingListProspectCustomer.value && prospectCustomerController.listProspectCustomer.value == null) {
                return Expanded(
                  child: Center(
                    child: EmptyStateGlobalWidget(
                      additionalSpacing: SpacingConstant.verticalSpacing80px,
                    ),
                  ),
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 16,
                    ),
                    itemCount: prospectCustomerController.listProspectCustomer.value!.length,
                    separatorBuilder: (context, index) => SpacingConstant.verticalSpacing16px,
                    itemBuilder: (context, index) {
                      final customer = prospectCustomerController.listProspectCustomer.value![index];
                      return ItemCustomerGlobalWidget(
                        onTap: () => prospectCustomerController.showDetailDialog(customer),
                        index: index,
                        name: customer.name,
                        address: customer.installedAddress,
                        telephoneNumber: customer.phone,
                        status: customer.prospectCategory,
                      );
                    },
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
