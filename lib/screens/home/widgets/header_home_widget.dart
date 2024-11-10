import 'package:cached_network_image/cached_network_image.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/image_constant.dart';
import 'package:dasarata_mobile/constants/shadow_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:dasarata_mobile/controllers/profile_controller.dart';
import 'package:dasarata_mobile/utilities/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    Get.engine.addPostFrameCallback((_) {
      profileController.getProfileData();
    });
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
        boxShadow: ShadowConstant.shadowMd,
        color: ColorConstant.whiteColor,
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Obx(
        () {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${DateTimeUtils.getGreeting()},",
                    style: TextStyleConstant.regularParagraph.copyWith(
                      color: ColorConstant.neutralColor800,
                    ),
                  ),
                  Text(
                    profileController.isLoadingProfile.value || profileController.profileData.value == null
                        ? "Sales"
                        : profileController.profileData.value!.name.split(" ")[0],
                    style: TextStyleConstant.semiboldSubtitle,
                  ),
                ],
              ),
              ClipOval(
                child: profileController.isLoadingProfile.value || profileController.profileData.value == null || profileController.profileData.value!.photo.isEmpty
                    ? Image.asset(
                        ImageConstant.profilePlaceholder,
                        width: 55,
                        height: 55,
                      )
                    : CachedNetworkImage(
                        width: 55,
                        height: 55,
                        fit: BoxFit.cover,
                        imageUrl: profileController.profileData.value!.photo,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                          color: ColorConstant.primaryColor,
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          color: ColorConstant.dangerColor,
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
