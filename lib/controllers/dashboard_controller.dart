import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/models/dashboard/dashboard_model.dart';
import 'package:dasarata_mobile/models/profile/response_profile_model.dart' as response_profile_model;
import 'package:dasarata_mobile/services/dashboard_service.dart';
import 'package:dasarata_mobile/services/profile_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  ProfileService profileService = ProfileService();
  DashboardService dashboardService = DashboardService();
  RxBool isLoadingGetDashboard = RxBool(false);
  RxBool isLoadingGetUser = RxBool(false);
  Rxn<Data> dashboardData = Rxn<Data>();
  Rxn<response_profile_model.Data> profileData = Rxn<response_profile_model.Data>();
  Rxn<List<GrowthProspect>> prospectStatisticts = Rxn<List<GrowthProspect>>();
  Rxn<List<GrowthClosing>> closingStatisticts = Rxn<List<GrowthClosing>>();

  void fetchDashboardData() {
    getDashboardData();
    getUserData();
  }

  Future<void> getDashboardData() async {
    isLoadingGetDashboard.value = true;
    try {
      final response = await dashboardService.getDashboard();
      dashboardData.value = response.data?.data;
      prospectStatisticts.value = dashboardData.value?.growthProspect;
      closingStatisticts.value = dashboardData.value?.growthClosing;
    } catch (e) {
      if (e is DashboardModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      isLoadingGetDashboard.value = false;
    }
  }

  Future<void> getUserData() async {
    isLoadingGetUser.value = true;
    try {
      final response = await profileService.getProfile();
      profileData.value = response.data;
      print("ok");
    } catch (e) {
      print(e);
      if (e is response_profile_model.ResponseProfileModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      isLoadingGetUser.value = false;
    }
  }
}