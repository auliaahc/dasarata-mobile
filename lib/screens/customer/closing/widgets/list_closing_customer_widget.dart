import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/empty_state_global_widget.dart';
import 'package:dasarata_mobile/widgets/item_customer_global_widget.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ListClosingCustomerWidget extends StatelessWidget {
  const ListClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ClosingCustomerController closingCustomerController = Get.put(ClosingCustomerController());
    Get.engine.addPostFrameCallback((_) {
      closingCustomerController.resetDashboardClosingCustomer();
    });
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: Column(
        children: [
          Obx(
            () {
              if (closingCustomerController.isLoadingFetchDashboardData.value && closingCustomerController.listClosingCustomer.value.isEmpty) {
                return const Expanded(
                  child: Center(
                    child: LoadingAnimationGlobalWidget(),
                  ),
                );
              } else if (closingCustomerController.listDataConfiguration.value == null || closingCustomerController.listClosingCustomer.value.isEmpty) {
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
                    onEndOfPage: () => closingCustomerController.onEndOfPage(),
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      itemCount: closingCustomerController.listDataConfiguration.value!.to + (closingCustomerController.isLoadingFetchDashboardData.value ? 1 : 0),
                      separatorBuilder: (context, index) => SpacingConstant.verticalSpacing16px,
                      itemBuilder: (context, index) {
                        if (index == (closingCustomerController.listDataConfiguration.value!.to) && closingCustomerController.isLoadingFetchDashboardData.value) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: LoadingAnimationGlobalWidget(
                              size: 30,
                            ),
                          );
                        } else {
                          final customer = closingCustomerController.listClosingCustomer.value[index];
                          return ItemCustomerGlobalWidget(
                            onTap: () => closingCustomerController.moveToDetailScreen(customer.id),
                            index: index,
                            name: customer.fullName,
                            address: customer.installedAddress,
                            telephoneNumber: "085739206149", // TODO
                            status: customer.phaseStatus,
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
