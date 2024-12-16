import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/icon_constant.dart';
import 'package:dasarata_mobile/controllers/survey_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CurrentLocationFloatingButtonFooterSurveyClosingCustomerWidget
    extends StatelessWidget {
  const CurrentLocationFloatingButtonFooterSurveyClosingCustomerWidget(
      {super.key});

  @override
  Widget build(BuildContext context) {
    final SurveyClosingCustomerController surveyClosingCustomerController =
        Get.find();
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
                  borderRadius: BorderRadius.circular(32),
                ),
                onPressed: surveyClosingCustomerController.getCurrentLocation,
                child: surveyClosingCustomerController
                            .isLoadingGetCurrentLocation.value ==
                        true
                    ? const LoadingAnimationGlobalWidget(size: 28)
                    : Center(
                        child: SvgPicture.asset(IconConstant.currentLocation),
                      ),
              );
            },
          ),
        ),
      ],
    );
  }
}
