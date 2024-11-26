import 'package:dasarata_mobile/controllers/survey_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/button_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitButtonFooterSurveyClosingCustomerWidget extends StatelessWidget {
  const SubmitButtonFooterSurveyClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SurveyClosingCustomerController surveyClosingCustomerController =
        Get.find();
    return Obx(
      () {
        final bool isDisabled = surveyClosingCustomerController
                .isLoadingGetCurrentLocation.value ||
            surveyClosingCustomerController.isLoadingGetClosingCustomer.value ||
            surveyClosingCustomerController.isLoadingUpdateSurveyData.value;
        return ButtonGlobalWidget(
            isLoading:
                surveyClosingCustomerController.isLoadingUpdateSurveyData.value,
            isDisabled: isDisabled,
            label: "Submit",
            onTap: surveyClosingCustomerController.updateSurveyData);
      },
    );
  }
}
