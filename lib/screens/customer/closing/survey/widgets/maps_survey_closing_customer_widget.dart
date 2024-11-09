import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/controllers/home_point_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsHomePointClosingCustomerWidget extends StatelessWidget {
  const MapsHomePointClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomePointClosingCustomerController homePointClosingCustomerController = Get.find();
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: Obx(
        () {
          if (homePointClosingCustomerController.selectedLatLng.value == null) {
            return const Center(
              child: LoadingAnimationGlobalWidget(),
            );
          } else {
            return GoogleMap(
              onTap: (LatLng latLng) => homePointClosingCustomerController.onTapMaps(latLng),
              markers: Set<Marker>.from(homePointClosingCustomerController.selectedPoint),
              zoomControlsEnabled: false,
              compassEnabled: false,
              mapType: homePointClosingCustomerController.selectedMapType.value,
              initialCameraPosition: CameraPosition(
                zoom: 20,
                target: homePointClosingCustomerController.selectedLatLng.value!,
              ),
              onMapCreated: (GoogleMapController controller) {
                if (!homePointClosingCustomerController.mapsController.isCompleted) {
                  homePointClosingCustomerController.mapsController.complete(controller);
                }
              },
            );
          }
        },
      ),
    );
  }
}