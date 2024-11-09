import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/controllers/home_point_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/text_field_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class SearchHeaderHomePointClosingCustomerWidget extends StatelessWidget {
  const SearchHeaderHomePointClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePointClosingCustomerController homePointClosingCustomerController = Get.find();
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 10,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
        color: ColorConstant.whiteColor,
      ),
      child: Center(
        child: TextFieldGlobalWidget(
          controller: homePointClosingCustomerController.latLngController,
          maxLines: 1,
          icon: LineIcons.mapPin,
          hint: "Latitude, Longitude",
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.text,
          onSubmit: (String query) => homePointClosingCustomerController.onSubmitLatLng(query),
        ),
      ),
    );
  }
}
