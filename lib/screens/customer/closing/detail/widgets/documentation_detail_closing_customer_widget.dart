import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/utilities/image_preview_utils.dart';
import 'package:dasarata_mobile/widgets/accordion_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class DocumentationDetailClosingCustomerWidget extends StatelessWidget {
  const DocumentationDetailClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ClosingCustomerController closingCustomerController = Get.find();
    return Obx(
      () {
        final List<Map<String, dynamic>> documentationInformation = [
          {
            "field": "Foto KTP",
            "value": closingCustomerController.detailClosingCustomer.value!.photoKtpUrl,
          },
          {
            "field": "Foto Rumah",
            "value": closingCustomerController.detailClosingCustomer.value!.photoHomeUrl,
          },
        ];
        return AccordionGlobalWidget(
          title: "Dokumentasi",
          widgetItems: ListView.separated(
            separatorBuilder: (context, index) => SpacingConstant.verticalSpacing12px,
            itemCount: documentationInformation.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final data = documentationInformation[index];
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
                  TextButton(
                    onPressed: () {
                      ImagePreviewUtils.showFullscreenImagePreview(
                        imageUrl: data["value"],
                        heroTag: data["value"],
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          LineIcons.imageFile,
                          color: ColorConstant.primaryColor,
                        ),
                        SpacingConstant.horizontalSpacing4px,
                        Text(
                          "Lihat Pratinjau",
                          style: TextStyleConstant.mediumParagraph.copyWith(
                            color: ColorConstant.neutralColor800,
                          ),
                        ),
                      ],
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
