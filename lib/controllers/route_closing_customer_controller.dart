import 'dart:async';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/controllers/detail_closing_customer_controller.dart';
import 'package:dasarata_mobile/models/customer/closing/request_route_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/response_find_closing_customer_model.dart';
import 'package:dasarata_mobile/models/response_global_model.dart';
import 'package:dasarata_mobile/services/closing_customer_service.dart';
import 'package:dasarata_mobile/services/google_maps_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';
import 'package:flutter_map_math/flutter_geo_math.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteClosingCustomerController extends GetxController {
  GoogleMapsService googleMapsService = GoogleMapsService();
  ClosingCustomerService closingCustomerService = ClosingCustomerService();
  DetailClosingCustomerController detailClosingCustomerController = Get.put(DetailClosingCustomerController());
  FlutterMapMath flutterMapMath = FlutterMapMath();
  Completer<GoogleMapController> mapsController =
      Completer<GoogleMapController>();
  RxBool isLoadingGetClosingCustomerData = RxBool(false);
  Rxn<Data> closingCustomerDetail = Rxn<Data>();
  Rxn<LatLng> customerLatLng = Rxn<LatLng>();
  Rxn<LatLng> spliterLatLng = Rxn<LatLng>();
  RxInt selectedMapTypeIndex = RxInt(0);
  Rx<MapType> selectedMapType = Rx<MapType>(MapType.normal);
  RxSet<Marker> markers = RxSet<Marker>();
  RxSet<Polyline> polylines = RxSet<Polyline>();
  RxList<LatLng> routeLatLng = RxList<LatLng>();
  RxDouble distance = RxDouble(0);
  RxList<double> listDistance = RxList<double>();
  RxBool isLoadingUpdateRouteData = RxBool(false);
  ClosingCustomerController closingCustomerController =
      Get.put(ClosingCustomerController());

  Future<void> updateRouteData() async {
    isLoadingUpdateRouteData.value = true;
    try {
      final response = await closingCustomerService.patchPhaseStatus(
        id: closingCustomerDetail.value!.id,
        model: RequestRouteClosingCustomerModel(
          length: distance.value,
          lengthText: "${distance.value.toStringAsFixed(2)} m",
          points: markers
              .where(
                (marker) =>
                    marker.markerId.value != "customer" &&
                    marker.markerId.value != "spliter",
              )
              .map(
                (marker) => Point(
                  lat: marker.position.latitude.toString(),
                  lng: marker.position.longitude.toString(),
                ),
              )
              .toList(),
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
      isLoadingUpdateRouteData.value = false;
    }
  }

  Future<void> getClosingCustomerData(int closingId) async {
    isLoadingGetClosingCustomerData.value = true;
    try {
      final response =
          await closingCustomerService.getClosingCustomer(closingId);
      closingCustomerDetail.value = response.data;
      customerLatLng.value = LatLng(
        closingCustomerDetail.value!.latitude,
        closingCustomerDetail.value!.longitude,
      );
      spliterLatLng.value = LatLng(
        closingCustomerDetail.value!.spliter.latitude,
        closingCustomerDetail.value!.spliter.longitude,
      );
      updateCustomerAndSpliterMarkers();
      moveCameraToBounds();
    } catch (e) {
      if (e is ResponseFindClosingCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      isLoadingGetClosingCustomerData.value = false;
    }
  }

  void updateCustomerAndSpliterMarkers() {
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId("customer"),
        position: customerLatLng.value!,
        infoWindow: const InfoWindow(title: "Customer"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
    markers.add(
      Marker(
        markerId: const MarkerId("spliter"),
        position: spliterLatLng.value!,
        infoWindow: const InfoWindow(title: "Spliter"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ),
    );
  }

  void addRoute(LatLng latLng) {
    final Marker marker = Marker(
      markerId: MarkerId(latLng.toString()),
      position: latLng,
      onTap: () => deleteRouteMarker(latLng, MarkerId(latLng.toString())),
      draggable: true,
      onDragEnd: (newLatLng) => moveRouteMarker(latLng, newLatLng),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    );
    markers.add(marker);
    routeLatLng.add(latLng);
    updatePolyline();
    calculateDistance();
  }

  void calculateDistance() {
    distance.value = 0;
    int totalIndex = routeLatLng.length - 1;
    if (totalIndex > 0) {
      for (int i = 0; i < totalIndex; i++) {
        double tempDistance = flutterMapMath.distanceBetween(
          routeLatLng[i].latitude,
          routeLatLng[i].longitude,
          routeLatLng[i + 1].latitude,
          routeLatLng[i + 1].longitude,
          "meters",
        );
        distance.value += tempDistance;
      }
    }
  }

  void moveRouteMarker(LatLng oldLatLng, LatLng newLatLng) async {
    List<Marker> listMarkers = markers.toList();
    for (int i = 0; i < listMarkers.length; i++) {
      if (listMarkers[i].position == oldLatLng) {
        listMarkers[i] = Marker(
          markerId: MarkerId(newLatLng.toString()),
          position: newLatLng,
          onTap: () =>
              deleteRouteMarker(newLatLng, MarkerId(newLatLng.toString())),
          draggable: true,
          onDragEnd: (latLng) => moveRouteMarker(newLatLng, latLng),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        );
        break;
      }
    }
    markers.clear();
    markers.addAll(listMarkers.toSet());
    List<LatLng> listLatLng = routeLatLng.toList();
    for (int i = 0; i < listLatLng.length; i++) {
      if (listLatLng[i] == oldLatLng) {
        listLatLng[i] = newLatLng;
        break;
      }
    }
    routeLatLng.clear();
    routeLatLng.addAll(listLatLng.toList());
    polylines.clear();
    updatePolyline();
    calculateDistance();
  }

  void updatePolyline() {
    polylines.add(
      Polyline(
        polylineId: const PolylineId("routePolyline"),
        points: routeLatLng,
        color: ColorConstant.secondaryColor,
      ),
    );
  }

  void deleteRouteMarker(LatLng latLng, MarkerId markerId) {
    markers.removeWhere((marker) => marker.markerId == markerId);
    routeLatLng.remove(latLng);
    updatePolyline();
    calculateDistance();
  }

  Future<void> moveCameraToBounds() async {
    final controller = await mapsController.future;
    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(
        min(customerLatLng.value!.latitude, spliterLatLng.value!.latitude),
        min(customerLatLng.value!.longitude, spliterLatLng.value!.longitude),
      ),
      northeast: LatLng(
        max(customerLatLng.value!.latitude, spliterLatLng.value!.latitude),
        max(customerLatLng.value!.longitude, spliterLatLng.value!.longitude),
      ),
    );
    await controller.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, 150),
    );
  }

  void changeMapType(int index) {
    selectedMapTypeIndex.value = index;
    if (selectedMapTypeIndex.value == 0) {
      selectedMapType.value = MapType.normal;
    } else {
      selectedMapType.value = MapType.satellite;
    }
  }
}
