import 'dart:async';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dasarata_mobile/models/maps/spliter_maps_model.dart' as spliter_maps_model;
import 'package:dasarata_mobile/services/google_maps_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';

class MapsProspectCustomerController extends GetxController {
  RxBool isLoadingCurrentLocation = RxBool(false);
  RxBool isLoadingGetAddress = RxBool(false);
  RxInt selectedMapTypeIndex = RxInt(0);
  Rx<MapType> selectedMapType = Rx<MapType>(MapType.normal);
  GoogleMapsService googleMapsService = GoogleMapsService();
  Rxn<List<spliter_maps_model.Datum>> spliterData = Rxn<List<spliter_maps_model.Datum>>();
  RxSet<Marker> markers = RxSet<Marker>();
  Completer<GoogleMapController> mapsController = Completer<GoogleMapController>();
  Rxn<Position> currentPosition = Rxn<Position>();
  Rxn<LatLng> currentLatLng = Rxn<LatLng>();
  Rxn<Placemark> currentPlacemark = Rxn<Placemark>();
  RxnString currentAddress = RxnString();
  TextEditingController searchMapsController = TextEditingController();
  RxnString searchMaps = RxnString();

  void checkAddressForSearchController(String? address) {
    if (address != null && address != "") {
      searchMapsController.text = address;
      searchMaps.value = searchMapsController.text;
      submitSearchMaps(searchMaps.value!);
    } else {
      searchMapsController.clear();
      getCurrentPosition();
    }
  }

  Future<void> submitSearchMaps(String query) async {
    searchMaps.value = query;
    if (searchMaps.value != null) {
      final input = searchMaps.value!.trim();
      final latLngDetector = RegExp(r"^-?\d+(\.\d+)?\s*,\s*-?\d+(\.\d+)?$");
      if (latLngDetector.hasMatch(input)) {
        final parts = input.split(',');
        final latitude = double.parse(parts[0].trim());
        final longitude = double.parse(parts[1].trim());
        currentLatLng.value = LatLng(latitude, longitude);
        await moveCamera(currentLatLng.value!);
        updateCurrentLocationMarker();
        await getAddress(currentLatLng.value!);
      } else {
        await getAddressLatLngFromAddressPlusCode();
      }
    } else if (searchMaps.value == null || searchMaps.value!.isEmpty) {
      SnackbarUtils.show(
        messageText: "Terdapat kesalahan format input",
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

  Future<void> getCurrentPosition() async {
    searchMapsController.clear();
    searchMaps.value = null;
    isLoadingCurrentLocation.value = true;
    await handleLocationPermission();
    try {
      currentPosition.value = await Geolocator.getCurrentPosition();
      if (currentPosition.value != null) {
        currentLatLng.value = LatLng(
          currentPosition.value!.latitude,
          currentPosition.value!.longitude,
        );
        await moveCamera(currentLatLng.value!);
        updateCurrentLocationMarker();
        await getAddress(currentLatLng.value!);
      }
    } catch (e) {
      SnackbarUtils.show(
        messageText: e.toString(),
        type: AnimatedSnackBarType.error,
      );
    } finally {
      isLoadingCurrentLocation.value = false;
    }
  }

  Future<void> getAddress(LatLng latLng) async {
    isLoadingGetAddress.value = true;
    currentAddress.value = null;
    try {
      final response = await googleMapsService.getPlacemarks(
        latitude: latLng.latitude,
        longitude: latLng.longitude,
      );
      currentPlacemark.value = response.first;
      if (currentPlacemark.value != null) {
        currentAddress.value = "${currentPlacemark.value?.street ?? "Unknown Street"}, ${currentPlacemark.value!.subLocality}, ${currentPlacemark.value!.locality}, ${currentPlacemark.value!.subAdministrativeArea}";
      }
    } catch (e) {
      SnackbarUtils.show(
        messageText: e.toString(),
        type: AnimatedSnackBarType.error,
      );
    } finally {
      isLoadingGetAddress.value = false;
    }
  }

  Future<void> getAddressLatLngFromAddressPlusCode() async {
    isLoadingGetAddress.value = true;
    try {
      final response = await googleMapsService.getPlacemarkFromAddressPlusCode(searchMaps.value!);
      currentPlacemark.value = response["placemarks"].first;
      currentPosition.value = response["position"];
      if (currentPosition.value != null && currentPosition.value != null) {
        currentLatLng.value = LatLng(
          currentPosition.value!.latitude,
          currentPosition.value!.longitude,
        );
        currentAddress.value = "${currentPlacemark.value?.street ?? "Unknown Street"}, ${currentPlacemark.value?.subLocality}, ${currentPlacemark.value?.locality}, ${currentPlacemark.value!.subAdministrativeArea}";
        updateCurrentLocationMarker();
        await moveCamera(currentLatLng.value!);
      }
    } catch (e) {
      SnackbarUtils.show(
        messageText: e.toString(),
        type: AnimatedSnackBarType.error,
      );
    } finally {
      isLoadingGetAddress.value = false;
    }
  }

  Future<void> moveCamera(LatLng latLng) async {
    final controller = await mapsController.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latLng,
          zoom: 20,
        ),
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

  Future<void> onTapMaps(LatLng latLng) async {
    searchMapsController.clear();
    searchMaps.value = null;
    currentLatLng.value = latLng;
    await moveCamera(currentLatLng.value!);
    updateCurrentLocationMarker();
    await getAddress(currentLatLng.value!);
  }

  void updateCurrentLocationMarker() {
    final marker = Marker(
      markerId: const MarkerId("currentLocationMarker"),
      position: currentLatLng.value!,
    );
    markers.add(marker);
  }

  void updateSpliterMarker() {
    markers.removeWhere((marker) => marker.markerId.value != "currentLocationMarker");
    for (spliter_maps_model.Datum spliter in spliterData.value ?? []) {
      final Marker marker = Marker(
        markerId: MarkerId(spliter.id.toString()),
        position: LatLng(
          spliter.lat,
          spliter.lng,
        ),
        infoWindow: InfoWindow(
          title: spliter.spliter,
          snippet: "${spliter.customers} Customers",
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      );
      markers.add(marker);
    }
  }

  Future<void> getSpliterData() async {
    try {
      final response = await googleMapsService.getSpliters();
      spliterData.value = response.data;
      updateSpliterMarker();
    } catch (e) {
      if (e is spliter_maps_model.SpliterMapsModel) {
        SnackbarUtils.show(
          messageText: e.message!,
          type: AnimatedSnackBarType.error,
        );
      }
    }
  }
}