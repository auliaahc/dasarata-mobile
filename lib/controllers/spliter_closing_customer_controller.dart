import 'dart:async';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/models/customer/closing/request_spliter_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/response_find_closing_customer_model.dart';
import 'package:dasarata_mobile/models/customer/closing/spliter_closing_customer_model.dart';
import 'package:dasarata_mobile/models/maps/spliter_maps_model.dart';
import 'package:dasarata_mobile/models/response_global_model.dart';
import 'package:dasarata_mobile/services/closing_customer_service.dart';
import 'package:dasarata_mobile/services/google_maps_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SpliterClosingCustomerController extends GetxController {
  ClosingCustomerController closingCustomerController =
      Get.put(ClosingCustomerController());
  GoogleMapsService googleMapsService = GoogleMapsService();
  ClosingCustomerService closingCustomerService = ClosingCustomerService();
  Completer<GoogleMapController> mapsController =
      Completer<GoogleMapController>();
  RxInt selectedMapTypeIndex = RxInt(0);
  Rx<MapType> selectedMapType = Rx<MapType>(MapType.normal);
  Rxn<Data> closingCustomerDetail = Rxn<Data>();
  RxSet<Marker> markers = RxSet<Marker>();
  Rxn<List<Datum>> spliters = Rxn<List<Datum>>();
  Rxn<SpliterClosingCustomerModel> selectedSpliter =
      Rxn<SpliterClosingCustomerModel>();
  Rxn<LatLng> customerLatLng = Rxn<LatLng>();
  RxBool isLoadingUpdateSpliterData = RxBool(false);
  RxBool isLoadingGetClosingCustomerData = RxBool(false);
  RxBool isLoadingGetSplitersData = RxBool(false);

  Future<void> updateSpliterData() async {
    isLoadingUpdateSpliterData.value = true;
    try {
      final response = await closingCustomerService.patchPhaseStatus(
        id: closingCustomerDetail.value!.id,
        model: RequestSpliterClosingCustomerModel(
          spliterId: selectedSpliter.value!.id,
          coverageAreaId: selectedSpliter.value!.coverageAreaId,
        ),
      );
      Get.back();
      closingCustomerController.getClosingCustomerData(
          closingCustomerController.detailClosingCustomer.value!.id);
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
      isLoadingUpdateSpliterData.value = false;
    }
  }

  Future<void> getSplitersData() async {
    isLoadingGetSplitersData.value = true;
    try {
      final response = await googleMapsService.getSpliters();
      spliters.value = response.data;
      updateSpliterMarkers();
    } catch (e) {
      if (e is SpliterMapsModel) {
        SnackbarUtils.show(
          messageText: e.message!,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      isLoadingGetSplitersData.value = false;
    }
  }

  void fetchData(int closingId) {
    getClosingCustomerData(closingId);
    getSplitersData();
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
      updateCustomerMarker();
      moveCamera(customerLatLng.value!);
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

  void moveCameraToCustomerLocation() {
    moveCamera(customerLatLng.value!);
  }

  void updateSpliterMarkers() {
    markers.removeWhere((marker) => marker.markerId.value != "customer");
    for (Datum data in spliters.value ?? []) {
      final Marker marker = Marker(
        markerId: MarkerId(data.id.toString()),
        position: LatLng(
          data.lat,
          data.lng,
        ),
        infoWindow: InfoWindow(
          title: data.spliter,
          snippet: "${data.customers} Customers",
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          selectedSpliter.value = SpliterClosingCustomerModel(
            id: data.id,
            coverageAreaId: data.coverageAreaId,
            latitude: data.lat,
            longitude: data.lng,
            customers: data.customers,
            area: data.area,
            spliter: data.spliter,
          );
          Marker tempSpliter = Marker(
            markerId: MarkerId(data.id.toString()),
            position: LatLng(
              data.lat,
              data.lng,
            ),
            infoWindow: InfoWindow(
              title: data.spliter,
              snippet: "${data.customers} Customers",
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
          );
          markers.add(tempSpliter);
        },
      );
      markers.add(marker);
    }
  }

  void updateCustomerMarker() {
    final marker = Marker(
      markerId: const MarkerId("customer"),
      position: customerLatLng.value!,
      infoWindow: const InfoWindow(title: "Customer"),
    );
    markers.add(marker);
  }

  void changeMapType(int index) {
    selectedMapTypeIndex.value = index;
    if (selectedMapTypeIndex.value == 0) {
      selectedMapType.value = MapType.normal;
    } else {
      selectedMapType.value = MapType.satellite;
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
}
