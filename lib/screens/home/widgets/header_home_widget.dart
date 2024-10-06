import 'package:cached_network_image/cached_network_image.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/shadow_constant.dart';
import 'package:flutter/material.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String profilePictureUrl = "https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg";
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
        children: [
          const Column(
            children: [
              Text("Selamat Pagi"),
              Text("User"),
            ],
          ),
          CachedNetworkImage(
            imageUrl: profilePictureUrl,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget:(context, url, error) => const Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}
