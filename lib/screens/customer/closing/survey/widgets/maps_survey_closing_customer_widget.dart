import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/controllers/survey_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsSurveyClosingCustomerWidget extends StatelessWidget {
  const MapsSurveyClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SurveyClosingCustomerController surveyClosingCustomerController =
        Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.backgroundColor,
      body: Obx(
        () {
          if (surveyClosingCustomerController.selectedLatLng.value == null) {
            return const Center(
              child: LoadingAnimationGlobalWidget(),
            );
          } else {
            return GoogleMap(
              onTap: (LatLng latLng) =>
                  surveyClosingCustomerController.onTapMaps(latLng),
              markers: Set<Marker>.from(
                  surveyClosingCustomerController.selectedPoint),
              zoomControlsEnabled: false,
              compassEnabled: false,
              mapType: surveyClosingCustomerController.selectedMapType.value,
              initialCameraPosition: CameraPosition(
                zoom: 20,
                target: surveyClosingCustomerController.selectedLatLng.value!,
              ),
              onMapCreated: (GoogleMapController controller) {
                if (!surveyClosingCustomerController
                    .mapsController.isCompleted) {
                  surveyClosingCustomerController.mapsController
                      .complete(controller);
                }
              },
            );
          }
        },
      ),
    );
  }
}
