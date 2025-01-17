import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/config/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class AddFloatingButtonDashboardProspectCustomerWidget extends StatelessWidget {
  const AddFloatingButtonDashboardProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: FloatingActionButton(
        backgroundColor: ColorConstant.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: Icon(
            LineIcons.plus,
            color: ColorConstant.whiteColor,
          ),
        ),
        onPressed: () => Get.toNamed(AppRoute.addProspectCustomer),
      ),
    );
  }
}
