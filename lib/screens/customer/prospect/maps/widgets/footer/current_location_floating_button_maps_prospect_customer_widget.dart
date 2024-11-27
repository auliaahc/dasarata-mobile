import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/icon_constant.dart';
import 'package:dasarata_mobile/controllers/maps_prospect_customer_controller.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CurrentLocationFloatingButtonMapsProspectCustomerWidget extends StatelessWidget {
  const CurrentLocationFloatingButtonMapsProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MapsProspectCustomerController mapsProspectCustomerController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 56,
          height: 56,
          child: Obx(
            () {
              return FloatingActionButton(
                backgroundColor: ColorConstant.whiteColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                onPressed: mapsProspectCustomerController.getCurrentPosition,
                child: mapsProspectCustomerController.isLoadingCurrentLocation.value ==
                        true
                    ? const LoadingAnimationGlobalWidget(size: 28)
                    : Center(
                        child: SvgPicture.asset(IconConstant.currentLocation)),
              );
            },
          ),
        ),
      ],
    );
  }
}
