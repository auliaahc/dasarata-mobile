import 'package:cached_network_image/cached_network_image.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:flutter/material.dart';

class PhotoHeaderProfileWidget extends StatelessWidget {
  const PhotoHeaderProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        width: 125,
        height: 125,
        fit: BoxFit.cover,
        imageUrl: "https://storage.googleapis.com/developer_dasarata/employee/foto_profile/WIN_20240401_21_27_02_Pro.jpg",
        placeholder: (context, url) => CircularProgressIndicator(
          color: ColorConstant.primaryColor,
        ),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          color: ColorConstant.dangerColor,
        ),
      ),
    );
  }
}
