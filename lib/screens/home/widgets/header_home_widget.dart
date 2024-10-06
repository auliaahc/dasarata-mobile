import 'package:cached_network_image/cached_network_image.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/shadow_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:dasarata_mobile/utilities/date_time_utils.dart';
import 'package:flutter/material.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const String profilePictureUrl = "https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg";
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
      child: Row(
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
                "User",
                style: TextStyleConstant.semiboldSubtitle,
              ),
            ],
          ),
          ClipOval(
            child: CachedNetworkImage(
              width: 55,
              height: 55,
              fit: BoxFit.cover,
              imageUrl: profilePictureUrl,
              placeholder: (context, url) => CircularProgressIndicator(color: ColorConstant.primaryColor),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: ColorConstant.dangerColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}