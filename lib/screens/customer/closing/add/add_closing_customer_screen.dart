import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/screens/customer/closing/add/widgets/form_add_closing_customer_widget.dart';
import 'package:dasarata_mobile/widgets/appbar_global_widget.dart';
import 'package:flutter/material.dart';

class AddClosingCustomerScreen extends StatelessWidget {
  const AddClosingCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: const AppbarGlobalWidget(title: "Data Customer Closing", implyLeading: true,),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            FormAddClosingCustomerWidget(),
          ],
        ),
      ),
    );
  }
}
