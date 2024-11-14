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
        if (closingStatusPhase == "Teknis" || closingStatusPhase == "Personal") {
          activeStepIndex = 0;
        } else if (closingStatusPhase == "Survei") {
          activeStepIndex = 1;
        } else if (closingStatusPhase == "Path" || closingStatusPhase == "Spliter") {
          activeStepIndex = 2;
        } else {
          activeStepIndex = 3;
        }
        return SizedBox(
          height: 105,
          child: Center(
            child: EasyStepper(
              enableStepTapping: false,
              activeStep: activeStepIndex,
              activeStepTextColor: ColorConstant.primaryColor,
              activeStepBorderColor: ColorConstant.primaryColor,
              defaultStepBorderType: BorderType.normal,
              finishedStepBackgroundColor: ColorConstant.primaryColor,
              finishedStepTextColor: ColorConstant.primaryColor,
              steps: const [
                EasyStep(
                  icon: LineIcon.home(),
                  title: "Survei",
                ),
                EasyStep(
                  icon: LineIcon.mapPin(),
                  title: "Spliter",
                ),
                EasyStep(
                  icon: LineIcon.route(),
                  title: "Rute",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
