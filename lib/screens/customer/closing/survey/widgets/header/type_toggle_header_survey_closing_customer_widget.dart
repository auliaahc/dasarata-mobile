import 'package:dasarata_mobile/controllers/survey_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/type_maps_toggle_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeToggleHeaderSurveyClosingCustomerWidget extends StatelessWidget {
  const TypeToggleHeaderSurveyClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SurveyClosingCustomerController surveyClosingCustomerController = Get.find();
    return Obx(
      () {
        return TypeMapsToggleGlobalWidget(
          onToggle: (index) => surveyClosingCustomerController.changeMapType(index!),
          index: surveyClosingCustomerController.selectedMapTypeIndex.value,
        );
      },
    );
  }
}
