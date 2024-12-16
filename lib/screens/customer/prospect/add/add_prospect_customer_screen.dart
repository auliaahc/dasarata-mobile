import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/controllers/add_prospect_customer_controller.dart';
import 'package:dasarata_mobile/screens/customer/prospect/add/widgets/form_add_prospect_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/prospect/add/widgets/submit_button_add_prospect_customer_widget.dart';
import 'package:dasarata_mobile/widgets/appbar_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProspectCustomerScreen extends StatelessWidget {
  const AddProspectCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddProspectCustomerController addProspectCustomerController = Get.put(AddProspectCustomerController());
    Get.engine.addPostFrameCallback((_) {
      addProspectCustomerController.fetchInitialData();
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppbarGlobalWidget(
        title: "Tambah Customer Prospek",
        implyLeading: true,
      ),
      backgroundColor: ColorConstant.whiteColor,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              FormAddProspectCustomerWidget(),
              SubmitButtonAddProspectCustomerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
