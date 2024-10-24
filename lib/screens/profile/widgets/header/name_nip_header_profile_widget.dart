import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:dasarata_mobile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameNipHeaderProfileWidget extends StatelessWidget {
  const NameNipHeaderProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();
    return Obx(
      () {
        return Column(
          children: [
            Text(
              profileController.profileData.value!.name,
              style: TextStyleConstant.semiboldSubtitle,
            ),
            SpacingConstant.verticalSpacing2px,
            Text(
              profileController.profileData.value!.nip,
              style: TextStyleConstant.mediumParagraph.copyWith(
                color: ColorConstant.neutralColor700,
              ),
            ),
          ],
        );
      },
    );
  }
}
