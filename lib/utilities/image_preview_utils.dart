import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ImagePreviewUtils {
  static void showFullscreenImagePreview({
    required String imageUrl,
    required String heroTag,
    String errorText = "Gagal memuat gambar",
  }) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: SizedBox.expand(
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Hero(
              tag: heroTag,
              child: PhotoView(
                imageProvider: NetworkImage(imageUrl),
                backgroundDecoration: BoxDecoration(
                  color: ColorConstant.blackColor,
                ),
                errorBuilder: (context, error, stackTrace) => Center(
                  child: Text(
                    errorText,
                    style: TextStyleConstant.regularCaption.copyWith(
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                ),
                loadingBuilder: (context, event) => Center(
                  child: LoadingAnimationGlobalWidget(
                    color: ColorConstant.secondaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      barrierColor: ColorConstant.blackColor,
    );
  }
}
