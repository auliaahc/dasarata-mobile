import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';

class StatusDetailClosingCustomerWidget extends StatelessWidget {
  const StatusDetailClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ClosingCustomerController closingCustomerController = Get.find();
    return Obx(
      () {
        final String closingStatusPhase = closingCustomerController.detailClosingCustomer.value!.phaseStatus;
        int activeStepIndex;
        if (closingStatusPhase == "Teknis") {
          activeStepIndex = 0;
        } else if (closingStatusPhase == "Survei") {
          activeStepIndex = 1;
        } else if (closingStatusPhase == "Path") {
          activeStepIndex = 2;
        } else {
          activeStepIndex = 3;
        }
        return EasyStepper(
          activeStep: activeStepIndex,
          activeStepTextColor: ColorConstant.primaryColor,
          activeStepBorderColor: ColorConstant.primaryColor,
          defaultStepBorderType: BorderType.normal,
          activeStepIconColor: ColorConstant.primaryColor,
          finishedStepBackgroundColor: ColorConstant.primaryColor,
          finishedStepTextColor: ColorConstant.primaryColor,
          steps: const [
            EasyStep(
              icon: LineIcon.home(),
              title: "Titik Rumah",
            ),
            EasyStep(
              icon: LineIcon.mapPin(),
              title: "ODP",
            ),
            EasyStep(
              icon: LineIcon.route(),
              title: "Jalur",
            ),
          ],
        );
      },
    );
  }
}
