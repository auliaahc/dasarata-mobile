import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/icon_constant.dart';
import 'package:dasarata_mobile/controllers/spliter_closing_customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RegisteredLocationFooterSpliterClosingCustomerWidget extends StatelessWidget {
  const RegisteredLocationFooterSpliterClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SpliterClosingCustomerController spliterClosingCustomerController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 56,
          height: 56,
          child: FloatingActionButton(
            backgroundColor: ColorConstant.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            onPressed: spliterClosingCustomerController.moveCameraToCustomerLocation,
            child: Center(
              child: SvgPicture.asset(IconConstant.currentLocation),
            ),
          ),
        ),
      ],
    );
  }
}
