import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/controllers/detail_closing_customer_controller.dart';
import 'package:dasarata_mobile/controllers/survey_closing_customer_controller.dart';
import 'package:dasarata_mobile/screens/customer/closing/survey/widgets/footer/footer_survey_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/survey/widgets/header/header_survey_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/survey/widgets/maps_survey_closing_customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SurveyClosingCustomerScreen extends StatelessWidget {
  const SurveyClosingCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SurveyClosingCustomerController surveyClosingCustomerController = Get.put(SurveyClosingCustomerController());
    final DetailClosingCustomerController detailClosingCustomerController = Get.put(DetailClosingCustomerController());
    Get.engine.addPostFrameCallback((_) {
      surveyClosingCustomerController.fetchData(detailClosingCustomerController.detailClosingCustomer.value!.id);
    });
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: ColorConstant.whiteColor),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.whiteColor,
        body: const SafeArea(
          child: Stack(
            children: [
              MapsSurveyClosingCustomerWidget(),
              Positioned(
                left: 0,
                right: 0,
                child: HeaderSurveyClosingCustomerWidget(),
              ),
              Positioned(
                bottom: 32,
                left: 0,
                right: 0,
                child: FooterSurveyClosingCustomerWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
