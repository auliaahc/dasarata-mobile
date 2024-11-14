import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/accordion_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionDetailClosingCustomerWidget extends StatelessWidget {
  const SubscriptionDetailClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ClosingCustomerController closingCustomerController = Get.find();
    final TextStyle fieldTextStyle = TextStyleConstant.boldCaption.copyWith(
      color: ColorConstant.neutralColor600,
    );
    final TextStyle valueTextStyle = TextStyleConstant.mediumParagraph.copyWith(
      color: ColorConstant.neutralColor800,
    );
    return Obx(
      () {
        return AccordionGlobalWidget(
          title: "Subscription",
          widgetItems: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jenis Customer",
                style: fieldTextStyle,
              ),
              SpacingConstant.verticalSpacing2px,
              Text(
                closingCustomerController.detailClosingCustomer.value!.customerCategory ?? "-",
                style: valueTextStyle,
              ),
              SpacingConstant.verticalSpacing12px,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Paket Layanan",
                          style: fieldTextStyle,
                        ),
                        SpacingConstant.verticalSpacing2px,
                        Text(
                          closingCustomerController.detailClosingCustomer.value!.package.namePackage,
                          style: valueTextStyle,
                        ),
                      ],
                    ),
                  ),
                  SpacingConstant.horizontalSpacing24px,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Program",
                          style: fieldTextStyle,
                        ),
                        SpacingConstant.verticalSpacing2px,
                        Text(
                          closingCustomerController.detailClosingCustomer.value!.program.nameProgram,
                          style: valueTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
