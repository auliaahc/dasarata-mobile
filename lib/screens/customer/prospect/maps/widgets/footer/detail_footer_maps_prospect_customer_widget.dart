import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/lottie_constant.dart';
import 'package:dasarata_mobile/constants/shadow_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:dasarata_mobile/controllers/maps_prospect_customer_controller.dart';
import 'package:dasarata_mobile/widgets/container_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DetailFooterMapsProspectCustomerWidget extends StatelessWidget {
  const DetailFooterMapsProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MapsProspectCustomerController mapsProspectCustomerController = Get.find();
    return Obx(
      () {
        return ContainerGlobalWidget(
          shadow: ShadowConstant.appbarShadow,
          width: double.infinity,
          child: Row(
            children: [
              Lottie.asset(
                LottieConstant.locationDetail,
                width: 32,
              ),
              SpacingConstant.horizontalSpacing16px,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ALAMAT",
                      style: TextStyleConstant.boldCaption.copyWith(
                        color: ColorConstant.neutralColor600,
                      ),
                    ),
                    SpacingConstant.verticalSpacing2px,
                    Text(
                      mapsProspectCustomerController.currentAddress.value!,
                      style: TextStyleConstant.mediumParagraph.copyWith(
                        color: ColorConstant.neutralColor800,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
