import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/controllers/spliter_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsSpliterClosingCustomerWidget extends StatelessWidget {
  const MapsSpliterClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SpliterClosingCustomerController spliterClosingCustomerController =
        Get.find();
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: Obx(
        () {
          if (spliterClosingCustomerController.customerLatLng.value == null ||
              spliterClosingCustomerController.spliters.value == null) {
            return const Center(
              child: LoadingAnimationGlobalWidget(),
            );
          } else {
            return GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                if (!spliterClosingCustomerController
                    .mapsController.isCompleted) {
                  spliterClosingCustomerController.mapsController
                      .complete(controller);
                }
              },
              zoomControlsEnabled: false,
              compassEnabled: false,
              initialCameraPosition: CameraPosition(
                target: spliterClosingCustomerController.customerLatLng.value!,
                zoom: 40,
              ),
              mapType: spliterClosingCustomerController.selectedMapType.value,
              markers:
                  Set<Marker>.from(spliterClosingCustomerController.markers),
            );
          }
        },
      ),
    );
  }
}
