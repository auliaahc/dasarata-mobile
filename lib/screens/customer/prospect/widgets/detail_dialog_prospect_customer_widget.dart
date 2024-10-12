import 'package:dasarata_mobile/controllers/prospect_customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:dasarata_mobile/widgets/button_global_widget.dart';

class DetailDialogProspectCustomerWidget extends StatelessWidget {
  final String name;
  final String telephoneNumber;
  final String meetMethod;
  final String status;
  final String address;
  const DetailDialogProspectCustomerWidget({
    super.key,
    required this.name,
    required this.telephoneNumber,
    required this.meetMethod,
    required this.status,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final ProspectCustomerController prospectCustomerController = Get.put(ProspectCustomerController());
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: ColorConstant.whiteColor,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Detail Customer Prospek",
                style: TextStyleConstant.semiboldSubtitle,
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: ColorConstant.neutralColor600,
                ),
                onPressed: () => Get.back(),
              )
            ],
          ),
          SpacingConstant.verticalSpacing20px,
          Text(
            "NAMA",
            style: TextStyleConstant.boldCaption.copyWith(
              color: ColorConstant.neutralColor600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: TextStyleConstant.mediumCaption.copyWith(
              color: ColorConstant.neutralColor800,
            ),
          ),
          SpacingConstant.verticalSpacing12px,
          Text(
            "NOMOR TELEPON",
            style: TextStyleConstant.boldCaption.copyWith(
              color: ColorConstant.neutralColor600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            telephoneNumber,
            style: TextStyleConstant.mediumCaption.copyWith(
              color: ColorConstant.neutralColor800,
            ),
          ),
          SpacingConstant.verticalSpacing12px,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "METODE BERTEMU",
                    style: TextStyleConstant.boldCaption.copyWith(
                      color: ColorConstant.neutralColor600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    meetMethod,
                    style: TextStyleConstant.mediumCaption.copyWith(
                      color: ColorConstant.neutralColor800,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 70),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "STATUS",
                    style: TextStyleConstant.boldCaption.copyWith(
                      color: ColorConstant.neutralColor600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status,
                    style: TextStyleConstant.mediumCaption.copyWith(
                      color: ColorConstant.neutralColor800,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SpacingConstant.verticalSpacing12px,
          Text(
            "ALAMAT",
            style: TextStyleConstant.boldCaption.copyWith(
              color: ColorConstant.neutralColor600,
            ),
          ),
          SpacingConstant.verticalSpacing4px,
          Text(
            address,
            style: TextStyleConstant.mediumCaption.copyWith(
              color: ColorConstant.neutralColor800,
            ),
          ),
          SpacingConstant.verticalSpacing32px,
          ButtonGlobalWidget(
            label: "Hubungi via Whatsapp",
            onTap: () => prospectCustomerController.launchWhatsapp(telephoneNumber),
            isOutlined: true,
            icon: Icon(
              LineIcons.whatSApp,
              color: ColorConstant.successColor,
            ),
          ),
          SpacingConstant.verticalSpacing8px,
          ButtonGlobalWidget(
            label: "Closing",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}