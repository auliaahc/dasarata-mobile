import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/constants/logger_constant.dart';
import 'package:dasarata_mobile/models/customer/prospect/response_prospect_customer_model.dart';
import 'package:dasarata_mobile/screens/customer/prospect/widgets/detail_dialog_prospect_customer_widget.dart';
import 'package:dasarata_mobile/services/prospect_customer_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProspectCustomerController extends GetxController {
  RxBool isLoadingListProspectCustomer = RxBool(false);
  ProspectCustomerService prospectCustomerService = ProspectCustomerService();
  Rxn<List<Datum>> listProspectCustomer = Rxn<List<Datum>>();
  Rxn<Datum> selectedProspectCustomer = Rxn<Datum>();
  RxnString searchQuery = RxnString();
  RxInt selectedMapTypeIndex = RxInt(0);
  Rx<MapType> selectedMapType = Rx<MapType>(MapType.normal);
  Rx<CameraPosition> cameraPosition = Rx<CameraPosition>(
    const CameraPosition(
      zoom: 45,
      target: LatLng(
        -7.9597761273494285,
        112.6004210846571,
      ),
    ),
  );

  @override
  void onReady() {
    super.onReady();
    getAllProspectCustomerData();
  }

  void setSearchProspectCustomer(String query) {
    searchQuery.value = query;
    getAllProspectCustomerData();
  }

  void resetSearchProspectCustomer() {
    searchQuery.value = null;
  }

  Future<void> getAllProspectCustomerData() async {
    isLoadingListProspectCustomer.value = true;
    listProspectCustomer.value = null;
    try {
      final response = await prospectCustomerService.getAllProspectCustomerData(search: searchQuery.value);
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
      // Error handling
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
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high, // High accuracy level
      );

      // Gunakan data lokasi dengan akurasi tinggi
      LoggerConstant.error(
          "Posisi: Lat: ${position.latitude}, Long: ${position.longitude}");
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
