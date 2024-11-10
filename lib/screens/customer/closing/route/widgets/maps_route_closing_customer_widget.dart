import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dasarata_mobile/controllers/route_closing_customer_controller.dart';

class MapsRouteClosingCustomerWidget extends StatelessWidget {
  const MapsRouteClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RouteClosingCustomerController routeClosingCustomerController = Get.find();
    return Obx(() {
      return GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          if (!routeClosingCustomerController.mapsController.isCompleted) {
            routeClosingCustomerController.mapsController.complete(controller);
          }
        },
        zoomControlsEnabled: false,
        compassEnabled: false,
        initialCameraPosition: const CameraPosition(
          target: LatLng(-7.93229540342856, 112.58024506913546),
          zoom: 15,
        ),
        mapType: routeClosingCustomerController.selectedMapType.value,
        markers: Set<Marker>.from(routeClosingCustomerController.markers),
        polylines: routeClosingCustomerController.polylines.value,
        onTap: (latLng) => routeClosingCustomerController.addRoute(latLng),
      );
    });
  }
}
