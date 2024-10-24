import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/screens/customer/prospect/add/widgets/form_add_prospect_customer_widget.dart';
import 'package:dasarata_mobile/widgets/appbar_global_widget.dart';
import 'package:dasarata_mobile/widgets/button_global_widget.dart';
import 'package:flutter/material.dart';

class AddProspectCustomerScreen extends StatelessWidget {
  const AddProspectCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppbarGlobalWidget(
        title: "Tambah Customer Prospect",
        // implyLeading: true,
      ),
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              const FormAddProspectCustomerWidget(),
              Positioned(
                left: 0,
                right: 0,
                bottom: 32,
                child: ButtonGlobalWidget(
                  isLoading: false,
                  isDisabled: true,
                  label: "Submit",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
