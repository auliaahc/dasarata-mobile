import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/controllers/prospect_customer_controller.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsProspectCustomerWidget extends StatelessWidget {
  const MapsProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProspectCustomerController prospectCustomerController = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.backgroundColor,
      body: Obx(
        () {
          if (prospectCustomerController.currentLatLng.value == null) {
            return const Center(
              child: LoadingAnimationGlobalWidget(),
            );
          } else {
            return GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                if (!prospectCustomerController.mapsController.isCompleted) {
                  prospectCustomerController.mapsController.complete(controller);
                }
              },
              initialCameraPosition: CameraPosition(
                zoom: 20,
                target: prospectCustomerController.currentLatLng.value!,
              ),
              mapType: prospectCustomerController.selectedMapType.value,
              compassEnabled: false,
              zoomControlsEnabled: false,
              markers: Set<Marker>.from(prospectCustomerController.markers),
              onTap: (LatLng latLng) => prospectCustomerController.onTapMaps(latLng),
            );
          }
        },
      ),
    );
  }
}
