import 'package:dasarata_mobile/widgets/button_global_widget.dart';
import 'package:flutter/material.dart';

class SubmitButtonFooterRouteClosingCustomerWidget extends StatelessWidget {
  const SubmitButtonFooterRouteClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonGlobalWidget(
      isLoading: false,
      isDisabled: false,
      label: "Submit",
      onTap: () {},
    );
  }
}
