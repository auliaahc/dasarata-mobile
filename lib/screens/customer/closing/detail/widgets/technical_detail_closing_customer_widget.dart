import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:dasarata_mobile/controllers/detail_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/accordion_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechnicalDetailClosingCustomerWidget extends StatelessWidget {
  const TechnicalDetailClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailClosingCustomerController detailClosingCustomerController = Get.find();
    final TextStyle fieldTextStyle = TextStyleConstant.semiboldCaption.copyWith(
      color: ColorConstant.neutralColor600,
    );
    final TextStyle valueTextStyle = TextStyleConstant.regularParagraph.copyWith(
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
                          detailClosingCustomerController.detailClosingCustomer.value!
                                      .coverage.nameCoverage ==
                                  ""
                              ? "-"
                              : detailClosingCustomerController.detailClosingCustomer
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
                          detailClosingCustomerController.detailClosingCustomer.value!.spliter.spliterName == ""
                              ? "-"
                              : detailClosingCustomerController.detailClosingCustomer.value!.spliter.spliterName,
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
                          detailClosingCustomerController
                                      .detailClosingCustomer.value!.latitude ==
                                  0
                              ? "-"
                              : detailClosingCustomerController
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
                          detailClosingCustomerController
                                      .detailClosingCustomer.value!.longitude ==
                                  0
                              ? "-"
                              : detailClosingCustomerController
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
