import 'package:cached_network_image/cached_network_image.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/image_constant.dart';
import 'package:dasarata_mobile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoHeaderProfileWidget extends StatelessWidget {
  const PhotoHeaderProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();
    return Obx(
      () {
        return ClipOval(
          child: profileController.profileData.value!.photo.isEmpty
              ? Image.asset(
                  ImageConstant.profilePlaceholder,
                )
              : CachedNetworkImage(
                  width: 125,
                  height: 125,
                  fit: BoxFit.cover,
                  imageUrl: profileController.profileData.value!.photo,
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: ColorConstant.primaryColor,
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: ColorConstant.dangerColor,
                  ),
                ),
        );
      },
    );
  }
}
