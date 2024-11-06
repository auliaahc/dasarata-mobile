import 'dart:async';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/models/customer/prospect/category_prospect_customer_model.dart' as category_prospect_customer_model;
import 'package:dasarata_mobile/models/customer/prospect/meet_prospect_customer_model.dart' as meet_prospect_customer_model;
import 'package:dasarata_mobile/models/customer/prospect/request_form_prospect_customer_model.dart';
import 'package:dasarata_mobile/models/customer/prospect/response_form_prospect_customer_model.dart';
import 'package:dasarata_mobile/models/customer/prospect/response_prospect_customer_model.dart';
import 'package:dasarata_mobile/models/maps/spliter_maps_model.dart' as spliter_maps_model;
import 'package:dasarata_mobile/screens/customer/prospect/widgets/detail_dialog_prospect_customer_widget.dart';
import 'package:dasarata_mobile/services/google_maps_service.dart';
import 'package:dasarata_mobile/services/prospect_customer_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProspectCustomerController extends GetxController {
  ProspectCustomerService prospectCustomerService = ProspectCustomerService();
  Rxn<List<category_prospect_customer_model.Datum>> prospectCategoryData = Rxn<List<category_prospect_customer_model.Datum>>();
  Rxn<List<meet_prospect_customer_model.Datum>> prospectMeetData = Rxn<List<meet_prospect_customer_model.Datum>>();
  Rxn<List<Datum>> listProspectCustomer = Rxn<List<Datum>>();
  RxnString searchQuery = RxnString();
  RxInt selectedMapTypeIndex = RxInt(0);
  Rx<MapType> selectedMapType = Rx<MapType>(MapType.normal);
  Completer<GoogleMapController> mapsController = Completer<GoogleMapController>();
  Rxn<Position> currentPosition = Rxn<Position>();
  Rxn<LatLng> currentLatLng = Rxn<LatLng>();
  Rxn<Placemark> currentPlacemark = Rxn<Placemark>();
  RxnString currentAddress = RxnString();
  GoogleMapsService googleMapsService = GoogleMapsService();
  Rxn<List<spliter_maps_model.Datum>> spliterData = Rxn<List<spliter_maps_model.Datum>>();
  RxSet<Marker> markers = RxSet<Marker>();

  // Loading State
  RxBool isLoadingProspectCategory = RxBool(false);
  RxBool isLoadingProspectMeet = RxBool(false);
  RxBool isLoadingListProspectCustomer = RxBool(false);
  RxBool isLoadingCurrentLocation = RxBool(false);
  RxBool isLoadingGetAddress = RxBool(false);
  RxBool isLoadingAddProspectCustomer = RxBool(false);

  // Search Maps
  TextEditingController searchMapsController = TextEditingController();
  RxnString searchMaps = RxnString();

  // Form Add
  final GlobalKey<FormState> addProspectFormKey = GlobalKey<FormState>();
  Rxn<RequestFormProspectCustomerModel> prospectCustomerData = Rxn<RequestFormProspectCustomerModel>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxnString name = RxnString();
  RxnString address = RxnString();
  RxnString phone = RxnString();
  RxnString prospectMeetValue = RxnString();
  RxnString prospectCategoryValue = RxnString();
  RxBool isFormAddProspectCustomerValid = RxBool(false);

  void clearMapsState() {
    if (!mapsController.isCompleted) {
      mapsController.completeError("Resetting Maps Controller");
    }
    mapsController = Completer<GoogleMapController>();
    searchMapsController.clear();
    searchMaps.value = null;
    spliterData.value = null;
    markers.clear();
    currentLatLng.value = null;
    currentAddress.value = null;
  }

  void clearFormAddProspectCustomerState() {
    address.value = null;
    name.value = null;
    phone.value = null;
    prospectMeetValue.value = null;
    prospectCategoryValue.value = null;
    addressController.clear();
    nameController.clear();
    phoneController.clear();
    clearMapsState();
  }

  void onSubmitFormAddProspectCustomer(String nipSalesId) async {
    if (addProspectFormKey.currentState!.validate()) {
      isLoadingAddProspectCustomer.value = true;
      prospectCustomerData.value = RequestFormProspectCustomerModel(
        nipSalesId: nipSalesId,
        prospectCategoryId: int.parse(prospectCategoryValue.value!),
        prospectMeetId: int.parse(prospectMeetValue.value!),
        name: name.value!,
        phoneNumber: phone.value!,
        installedAddress: address.value!
      );
      try {
        final response = await prospectCustomerService.postCreateProspectCustomer(prospectCustomerData.value!);
        if (response.success) {
          SnackbarUtils.show(
            messageText: "Data customer prospek berhasil ditambahkan!",
            type: AnimatedSnackBarType.success,
          );
        }
        clearFormAddProspectCustomerState();
        Get.back();
      } catch (e) {
        if (e is ResponseFormProspectCustomerModel) {
          if (e.errors != null) {
            for (String data in e.errors!) {
              SnackbarUtils.show(
                messageText: data,
                type: AnimatedSnackBarType.error,
              );
            }
          } else {
            SnackbarUtils.show(
              messageText: e.message!,
              type: AnimatedSnackBarType.error,
            );
          }
        }
      } finally {
        isLoadingAddProspectCustomer.value = false;
      }
    }
  }

  void validateFormAddProspectCustomer() {
    isFormAddProspectCustomerValid.value = nameController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        prospectMeetValue.value != null &&
        prospectCategoryValue.value != null;
  }

  void checkAddressForSearchController() {
    if (address.value != null) {
      searchMapsController.text = address.value!;
      searchMaps.value = searchMapsController.text;
      doSearchMaps(searchMaps.value!);
    } else {
      searchMapsController.clear();
      getCurrentPosition();
    }
  }

  void setSearchProspectCustomer(String query) {
    searchQuery.value = query;
    getAllProspectCustomerData();
  }

  void resetSearchProspectCustomer() {
    searchQuery.value = null;
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
          double.parse(spliter.lat),
          double.parse(spliter.lng),
        ),
        infoWindow: InfoWindow(
          title: spliter.spliter,
          snippet: "${spliter.customers} Customer",
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      );
      markers.add(marker);
    }
  }

  Future<void> getSpliterData() async {
    try {
      final response = await googleMapsService.getSpliter();
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

  Future<void> getProspectCategoryData() async {
    isLoadingProspectCategory.value = true;
    try {
      final response = await prospectCustomerService.getProspectCategory();
      prospectCategoryData.value = response.data;
    } catch (e) {
      if (e is category_prospect_customer_model.CategoryProspectCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      isLoadingProspectCategory.value = false;
    }
  }

  Future<void> getProspectMeetData() async {
    isLoadingProspectMeet.value = true;
    try {
      final response = await prospectCustomerService.getProspectMeet();
      prospectMeetData.value = response.data;
    } catch (e) {
      if (e is meet_prospect_customer_model.MeetProspectCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      isLoadingProspectMeet.value = false;
    }
  }

  Future<void> getAllProspectCustomerData() async {
    isLoadingListProspectCustomer.value = true;
    listProspectCustomer.value = null;
    try {
      final response = await prospectCustomerService.getAllProspectCustomerData(
          search: searchQuery.value);
      listProspectCustomer.value = response.data;
    } catch (e) {
      if (e is ResponseProspectCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      isLoadingListProspectCustomer.value = false;
    }
  }

  void showDetailDialog(Datum data) {
    Get.dialog(
      DetailDialogProspectCustomerWidget(
        name: data.name,
        telephoneNumber: data.phone,
        meetMethod: data.meetCategory,
        status: data.prospectCategory,
        address: data.installedAddress,
      ),
    );
  }

  void launchWhatsapp(String telephoneNumber) async {
    String url = "https://api.whatsapp.com/send/?phone=$telephoneNumber";
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      SnackbarUtils.show(
        messageText: e.toString(),
        type: AnimatedSnackBarType.error,
      );
    }
  }

  void onSubmitMaps() {
    address.value = currentAddress.value;
    addressController.text = address.value!;
    Get.back();
    clearMapsState();
  }

  void changeMapType(int index) {
    selectedMapTypeIndex.value = index;
    if (selectedMapTypeIndex.value == 0) {
      selectedMapType.value = MapType.normal;
    } else {
      selectedMapType.value = MapType.satellite;
    }
  }

  Future<void> onTapMaps(LatLng latLng) async {
    searchMapsController.clear();
    searchMaps.value = null;
    currentLatLng.value = latLng;
    await moveCamera(currentLatLng.value!);
    updateCurrentLocationMarker();
    await getAddress(currentLatLng.value!);
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
      final response = await googleMapsService.getPlacemark(
          latLng.latitude, latLng.longitude);
      currentPlacemark.value = response.first;
      if (currentPlacemark.value != null) {
        currentAddress.value =
            "${currentPlacemark.value?.street ?? "Unknown Street"}, ${currentPlacemark.value!.subLocality}, ${currentPlacemark.value!.locality}, ${currentPlacemark.value!.subAdministrativeArea}";
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

  Future<void> doSearchMaps(String query) async {
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

  Future<void> getAddressLatLngFromAddressPlusCode() async {
    isLoadingGetAddress.value = true;
    try {
      final response = await googleMapsService
          .getPlacemarkFromAddressPlusCode(searchMaps.value!);
      currentPlacemark.value = response["placemarks"].first;
      currentPosition.value = response["position"];
      if (currentPosition.value != null && currentPosition.value != null) {
        currentLatLng.value = LatLng(
            currentPosition.value!.latitude, currentPosition.value!.longitude);
        currentAddress.value =
            "${currentPlacemark.value?.street ?? "Unknown Street"}, ${currentPlacemark.value?.subLocality}, ${currentPlacemark.value?.locality}, ${currentPlacemark.value!.subAdministrativeArea}";
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
        CameraPosition(target: latLng, zoom: 20),
      ),
    );
  }

  Future<bool> handleLocationPermission() async {
    bool locationServiceEnabled;
    LocationPermission locationPermission;
    try {
      locationServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!locationServiceEnabled) {
        SnackbarUtils.show(
          messageText: "Layanan lokasi tidak diaktifkan",
          type: AnimatedSnackBarType.error,
        );
        return false;
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
        } else if (locationPermission == LocationPermission.deniedForever) {
          SnackbarUtils.show(
            messageText:
                "Izin akses lokasi ditolak selamanya. Atur izin secara manual di pengaturan perangkat.",
            type: AnimatedSnackBarType.error,
          );
          return false;
        }
      }
      return await _requestAccurateLocation();
    } on PlatformException catch (e) {
      SnackbarUtils.show(
        messageText: e.toString(),
        type: AnimatedSnackBarType.error,
      );
      return false;
    }
  }

  Future<bool> _requestAccurateLocation() async {
    try {
      await Geolocator.getCurrentPosition();
      return true;
    } catch (e) {
      SnackbarUtils.show(
        messageText: "Gagal mendapatkan lokasi dengan akurasi tinggi: $e",
        type: AnimatedSnackBarType.error,
      );
      return false;
    }
  }
}
