import 'package:dasarata_mobile/controllers/prospect_customer_controller.dart';
import 'package:dasarata_mobile/screens/customer/prospect/maps/widgets/header/header_maps_prospect_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/prospect/maps/widgets/maps_prospect_customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapsProspectCustomerScreen extends StatelessWidget {
  const MapsProspectCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProspectCustomerController());
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            MapsProspectCustomerWidget(),
            Positioned(
              left: 0,
              right: 0,
              child: HeaderMapsProspectCustomerWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
