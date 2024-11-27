import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/controllers/add_prospect_customer_controller.dart';
import 'package:dasarata_mobile/controllers/maps_prospect_customer_controller.dart';
import 'package:dasarata_mobile/screens/customer/prospect/maps/widgets/footer/footer_maps_prospect_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/prospect/maps/widgets/header/header_maps_prospect_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/prospect/maps/widgets/maps_prospect_customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MapsProspectCustomerScreen extends StatelessWidget {
  const MapsProspectCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MapsProspectCustomerController mapsProspectCustomerController = Get.put(MapsProspectCustomerController());
    final AddProspectCustomerController addProspectCustomerController = Get.put(AddProspectCustomerController());
    Get.engine.addPostFrameCallback((_) {
      mapsProspectCustomerController.getSpliterData();
      mapsProspectCustomerController.checkAddressForSearchController(addProspectCustomerController.address.value);
    });
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: ColorConstant.whiteColor,
      ),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              MapsProspectCustomerWidget(),
              Positioned(
                left: 0,
                right: 0,
                child: HeaderMapsProspectCustomerWidget(),
              ),
              Positioned(
                bottom: 32,
                left: 0,
                right: 0,
                child: FooterMapsProspectCustomerWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
