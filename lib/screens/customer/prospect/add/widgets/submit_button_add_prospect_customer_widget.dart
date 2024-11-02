import 'package:dasarata_mobile/controllers/profile_controller.dart';
import 'package:dasarata_mobile/controllers/prospect_customer_controller.dart';
import 'package:dasarata_mobile/widgets/button_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitButtonAddProspectCustomerWidget extends StatelessWidget {
  const SubmitButtonAddProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProspectCustomerController prospectCustomerController = Get.find();
    final ProfileController profileController = Get.put(ProfileController());
    return Positioned(
      left: 0,
      right: 0,
      bottom: 32,
      child: Obx(
        () {
          return ButtonGlobalWidget(
            isLoading: false,
            isDisabled: !prospectCustomerController.isFormAddProspectCustomerValid.value,
            label: "Submit",
            onTap: () => prospectCustomerController.onSubmitFormAddProspectCustomer(profileController.profileData.value!.id.toString()),
          );
        },
      ),
    );
  }
}
