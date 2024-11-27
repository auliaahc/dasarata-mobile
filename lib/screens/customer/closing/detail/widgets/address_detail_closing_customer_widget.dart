import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:dasarata_mobile/controllers/detail_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/accordion_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetailClosingCustomerWidget extends StatelessWidget {
  const AddressDetailClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailClosingCustomerController detailClosingCustomerController = Get.find();
    final TextStyle fieldTextStyle = TextStyleConstant.semiboldCaption.copyWith(
      color: ColorConstant.neutralColor600,
    );
    final TextStyle valueTextStyle =TextStyleConstant.regularParagraph.copyWith(
      color: ColorConstant.neutralColor800,
    );
    return Obx(
      () {
        return AccordionGlobalWidget(
          title: "Alamat",
          widgetItems: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Alamat Terpasang",
                style: fieldTextStyle,
              ),
              SpacingConstant.verticalSpacing2px,
              Text(
                detailClosingCustomerController.detailClosingCustomer.value!.installedAddress,
                style: valueTextStyle,
              ),
              SpacingConstant.verticalSpacing12px,
              Text(
                "Alamat Domisili",
                style: fieldTextStyle,
              ),
              SpacingConstant.verticalSpacing2px,
              Text(
                detailClosingCustomerController.detailClosingCustomer.value!.domicileAddress,
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
                          "Provinsi",
                          style: fieldTextStyle,
                        ),
                        SpacingConstant.verticalSpacing2px,
                        Text(
                          detailClosingCustomerController.detailClosingCustomer.value!.provinces.name,
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
                          "Kota",
                          style: fieldTextStyle,
                        ),
                        SpacingConstant.verticalSpacing2px,
                        Text(
                          detailClosingCustomerController.detailClosingCustomer.value!.regency.name,
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
                          "Kecamatan",
                          style: fieldTextStyle,
                        ),
                        SpacingConstant.verticalSpacing2px,
                        Text(
                          detailClosingCustomerController.detailClosingCustomer.value!.district.name,
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
                          "Dusun",
                          style: fieldTextStyle,
                        ),
                        SpacingConstant.verticalSpacing2px,
                        Text(
                          detailClosingCustomerController.detailClosingCustomer.value!.village.name,
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
                          "RT",
                          style: fieldTextStyle,
                        ),
                        SpacingConstant.verticalSpacing2px,
                        Text(
                          detailClosingCustomerController.detailClosingCustomer.value!.rt,
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
                          "RW",
                          style: fieldTextStyle,
                        ),
                        SpacingConstant.verticalSpacing2px,
                        Text(
                          detailClosingCustomerController.detailClosingCustomer.value!.rw,
                          style: valueTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
