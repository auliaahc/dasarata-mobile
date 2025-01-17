import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:dasarata_mobile/controllers/detail_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/accordion_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalDetailClosingCustomerWidget extends StatelessWidget {
  const PersonalDetailClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailClosingCustomerController detailClosingCustomerController = Get.find();
    return Obx(
      () {
        final List<Map<String, dynamic>> personalInformation = [
          {
            "field": "Nama Lengkap",
            "value": detailClosingCustomerController.detailClosingCustomer.value!.name,
          },
          {
            "field": "NIK",
            "value": detailClosingCustomerController.detailClosingCustomer.value!.nik,
          },
          {
            "field": "Jenis Kelamin",
            "value": detailClosingCustomerController.detailClosingCustomer.value!.gender == "male"
                    ? "Laki-laki"
                    : "Perempuan",
          },
          {
            "field": "Nomor Telepon",
            "value": detailClosingCustomerController.detailClosingCustomer.value!.phoneNumber
          },
        ];
        return AccordionGlobalWidget(
          title: "Personal",
          widgetItems: ListView.separated(
            separatorBuilder: (context, index) => SpacingConstant.verticalSpacing12px,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: personalInformation.length,
            itemBuilder: (context, index) {
              final data = personalInformation[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data["field"],
                    style: TextStyleConstant.semiboldCaption.copyWith(
                      color: ColorConstant.neutralColor600,
                    ),
                  ),
                  SpacingConstant.verticalSpacing2px,
                  Text(
                    data["value"],
                    style: TextStyleConstant.regularParagraph.copyWith(
                      color: ColorConstant.neutralColor800,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
