import 'dart:async';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/controllers/detail_closing_customer_controller.dart';
import 'package:dasarata_mobile/models/customer/closing/request_survey_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/response_find_closing_customer_model.dart';
import 'package:dasarata_mobile/models/response_global_model.dart';
import 'package:dasarata_mobile/services/closing_customer_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SurveyClosingCustomerController extends GetxController {
  ClosingCustomerController closingCustomerController = Get.put(ClosingCustomerController());
  ClosingCustomerService closingCustomerService = ClosingCustomerService();
  DetailClosingCustomerController detailClosingCustomerController = Get.put(DetailClosingCustomerController());
  Completer<GoogleMapController> mapsController = Completer<GoogleMapController>();
  Rx<MapType> selectedMapType = Rx<MapType>(MapType.normal);
  Rxn<LatLng> selectedLatLng = Rxn<LatLng>();
  RxSet<Marker> selectedPoint = RxSet<Marker>();
  Rxn<Data> closingCustomerData = Rxn<Data>();
  RxBool isLoadingGetCurrentLocation = RxBool(false);
  RxBool isLoadingGetClosingCustomer = RxBool(false);
  RxBool isLoadingUpdateSurveyData = RxBool(false);
  RxInt selectedMapTypeIndex = RxInt(0);
  TextEditingController latLngController = TextEditingController();

  Future<void> updateSurveyData() async {
    isLoadingUpdateSurveyData.value = true;
    try {
      final response = await closingCustomerService.patchPhaseStatus(
        id: closingCustomerData.value!.id,
        model: RequestSurveyClosingCustomerModel(
          latitude: selectedLatLng.value!.latitude,
          longitude: selectedLatLng.value!.longitude,
        ),
      );
      Get.back();
      detailClosingCustomerController.getClosingCustomerData(detailClosingCustomerController.detailClosingCustomer.value!.id);
      closingCustomerController.resetDashboardClosingCustomer();
      SnackbarUtils.show(
        messageText: response.message,
        type: AnimatedSnackBarType.success,
      );
    } catch (e) {
      if (e is ResponseGlobalModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      isLoadingUpdateSurveyData.value = false;
    }
  }

  Future<void> fetchData(int closingId) async {
    await getClosingCustomer(closingId);
    if (selectedLatLng.value != null) {
      await moveCamera(selectedLatLng.value!);
    } else {
      await getCurrentLocation();
      await moveCamera(selectedLatLng.value!);
    }
  }

  void onSubmitLatLng(String latLngString) {
    final searchByLatLng = latLngString;
    final value = searchByLatLng.trim();
    final latLngDetector = RegExp(r"^-?\d+(\.\d+)?\s*,\s*-?\d+(\.\d+)?$");
    if (latLngDetector.hasMatch(value)) {
      final parts = value.split(",");
      final latitude = double.parse(parts[0].trim());
      final longitude = double.parse(parts[1].trim());
      selectedLatLng.value = LatLng(latitude, longitude);
      moveCamera(selectedLatLng.value!);
      updateMarker(selectedLatLng.value!);
    } else {
      SnackbarUtils.show(
        messageText: "Format tidak valid",
        type: AnimatedSnackBarType.error,
      );
    }
  }

  void changeMapType(int index) {
    selectedMapTypeIndex.value = index;
    if (selectedMapTypeIndex.value == 0) {
      selectedMapType.value = MapType.normal;
    } else {
      selectedMapType.value = MapType.satellite;
    }
  }

  Future<void> getCurrentLocation() async {
    isLoadingGetCurrentLocation.value = true;
    await handleLocationPermission();
    try {
      final response = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.low,
        ),
      );
      selectedLatLng.value = LatLng(
        response.latitude,
        response.longitude,
      );
      updateMarker(selectedLatLng.value!);
      moveCamera(selectedLatLng.value!);
      latLngController.text =
          "${selectedLatLng.value!.latitude}, ${selectedLatLng.value!.longitude}";
    } catch (e) {
      SnackbarUtils.show(
        messageText: e.toString(),
        type: AnimatedSnackBarType.error,
      );
    } finally {
      isLoadingGetCurrentLocation.value = false;
    }
  }

  Future<void> onTapMaps(LatLng latLng) async {
    selectedLatLng.value = latLng;
    latLngController.text =
        "${selectedLatLng.value!.latitude}, ${selectedLatLng.value!.longitude}";
    await updateMarker(selectedLatLng.value!);
    await moveCamera(latLng);
  }

  Future<void> updateMarker(LatLng latLng) async {
    final Marker marker = Marker(
      markerId: const MarkerId("selectedPoint"),
      position: LatLng(
        latLng.latitude,
        latLng.longitude,
      ),
    );
    selectedPoint.add(marker);
  }

  Future<void> getClosingCustomer(int closingId) async {
    isLoadingGetClosingCustomer.value = true;
    try {
      final response =
          await closingCustomerService.getClosingCustomer(closingId);
      closingCustomerData.value = response.data;
      if (closingCustomerData.value!.longitude != 0 &&
          closingCustomerData.value!.latitude != 0) {
        selectedLatLng.value = LatLng(
          closingCustomerData.value!.latitude,
          closingCustomerData.value!.longitude,
        );
        latLngController.text =
            "${selectedLatLng.value!.latitude}, ${selectedLatLng.value!.longitude}";
        updateMarker(selectedLatLng.value!);
      }
    } catch (e) {
      if (e is ResponseFindClosingCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      isLoadingGetClosingCustomer.value = false;
    }
  }

  Future<void> moveCamera(LatLng latLng) async {
    final controller = await mapsController.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 20),
      ),
    );
  }

  Future<bool> handleLocationPermission() async {
    bool locationServiceEnabled;
    LocationPermission locationPermission;

    locationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!locationServiceEnabled) {
      SnackbarUtils.show(
        messageText: "Layanan lokasi tidak diaktifkan",
        type: AnimatedSnackBarType.error,
      );
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        SnackbarUtils.show(
          messageText: "Izin akses lokasi ditolak",
          type: AnimatedSnackBarType.error,
        );
        return false;
      }
    }
    return true;
  }
}
