import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPathClosingCustomerWidget extends StatelessWidget {
  const MapsPathClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            -7.949090016149156,
            112.61361067526798,
          ),
          zoom: 50,
        ),
      ),
    );
  }
}
