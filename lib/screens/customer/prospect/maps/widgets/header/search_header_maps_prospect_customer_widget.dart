import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/widgets/text_field_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SearchHeaderMapsProspectCustomerWidget extends StatelessWidget {
  const SearchHeaderMapsProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: const Center(
        child: TextFieldGlobalWidget(
          controller: null,
          icon: LineIcons.search,
          hint: "Search",
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
