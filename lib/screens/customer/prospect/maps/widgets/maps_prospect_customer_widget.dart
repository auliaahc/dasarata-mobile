import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/controllers/maps_prospect_customer_controller.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsProspectCustomerWidget extends StatelessWidget {
  const MapsProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MapsProspectCustomerController mapsProspectCustomerController = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.backgroundColor,
      body: Obx(
        () {
          if (mapsProspectCustomerController.currentLatLng.value == null) {
            return const Center(
              child: LoadingAnimationGlobalWidget(),
            );
          } else {
            return GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                if (!mapsProspectCustomerController
                    .mapsController.isCompleted) {
                  mapsProspectCustomerController.mapsController
                      .complete(controller);
                }
              },
              initialCameraPosition: CameraPosition(
                zoom: 20,
                target: mapsProspectCustomerController.currentLatLng.value!,
              ),
              mapType: mapsProspectCustomerController.selectedMapType.value,
              compassEnabled: false,
              zoomControlsEnabled: false,
              markers: Set<Marker>.from(mapsProspectCustomerController.markers),
              onTap: (LatLng latLng) =>
                  mapsProspectCustomerController.onTapMaps(latLng),
            );
          }
        },
      ),
    );
  }
}
