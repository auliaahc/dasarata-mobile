import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/accordion_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechnicalDetailClosingCustomerWidget extends StatelessWidget {
  const TechnicalDetailClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ClosingCustomerController closingCustomerController = Get.find();
    final TextStyle fieldTextStyle = TextStyleConstant.semiboldCaption.copyWith(
      color: ColorConstant.neutralColor600,
    );
    final TextStyle valueTextStyle =
        TextStyleConstant.regularParagraph.copyWith(
      color: ColorConstant.neutralColor800,
    );
    return Obx(
      () {
        return AccordionGlobalWidget(
          title: "Teknis",
          widgetItems: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Area Cover",
                          style: fieldTextStyle,
                        ),
                        SpacingConstant.verticalSpacing2px,
                        Text(
                          closingCustomerController.detailClosingCustomer.value!
                                      .coverage.nameCoverage ==
                                  ""
                              ? "-"
                              : closingCustomerController.detailClosingCustomer
                                  .value!.coverage.nameCoverage,
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
                          "Spliter",
                          style: fieldTextStyle,
                        ),
                        SpacingConstant.verticalSpacing2px,
                        Text(
                          closingCustomerController.detailClosingCustomer.value!
                                      .spliter.spliterName ==
                                  ""
                              ? "-"
                              : closingCustomerController.detailClosingCustomer
                                  .value!.spliter.spliterName,
                          style: valueTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
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
                          "Latitude",
                          style: fieldTextStyle,
                        ),
                        SpacingConstant.verticalSpacing2px,
                        Text(
                          closingCustomerController
                                      .detailClosingCustomer.value!.latitude ==
                                  0
                              ? "-"
                              : closingCustomerController
                                  .detailClosingCustomer.value!.latitude
                                  .toString(),
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
                          "Longitude",
                          style: fieldTextStyle,
                        ),
                        SpacingConstant.verticalSpacing2px,
                        Text(
                          closingCustomerController
                                      .detailClosingCustomer.value!.longitude ==
                                  0
                              ? "-"
                              : closingCustomerController
                                  .detailClosingCustomer.value!.longitude
                                  .toString(),
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
