import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dasarata_mobile/controllers/route_closing_customer_controller.dart';

class MapsRouteClosingCustomerWidget extends StatelessWidget {
  const MapsRouteClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RouteClosingCustomerController routeClosingCustomerController =
        Get.find();
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: Obx(
        () {
          if (routeClosingCustomerController.spliterLatLng.value == null &&
              routeClosingCustomerController.customerLatLng.value == null) {
            return const Center(
              child: LoadingAnimationGlobalWidget(),
            );
          } else {
            return GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                if (!routeClosingCustomerController
                    .mapsController.isCompleted) {
                  routeClosingCustomerController.mapsController
                      .complete(controller);
                }
              },
              zoomControlsEnabled: false,
              compassEnabled: false,
              initialCameraPosition: CameraPosition(
                target: routeClosingCustomerController.customerLatLng.value!,
                zoom: 15,
              ),
              mapType: routeClosingCustomerController.selectedMapType.value,
              markers: Set<Marker>.from(routeClosingCustomerController.markers),
              polylines: routeClosingCustomerController.polylines.value,
              onTap: (latLng) =>
                  routeClosingCustomerController.addRoute(latLng),
            );
          }
        },
      ),
    );
  }
}
