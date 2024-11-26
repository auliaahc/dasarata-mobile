import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/models/profile/response_profile_model.dart';
import 'package:dasarata_mobile/config/app_route.dart';
import 'package:dasarata_mobile/models/response_global_model.dart';
import 'package:dasarata_mobile/services/authentication_service.dart';
import 'package:dasarata_mobile/services/profile_service.dart';
import 'package:dasarata_mobile/utilities/shared_pref.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  AuthenticationService authenticationService = AuthenticationService();
  ProfileService profileService = ProfileService();
  RxBool isLoadingGetProfile = RxBool(false);
  Rxn<Data> profileData = Rxn<Data>();

  Future<void> getProfileData() async {
    profileData.value = null;
    isLoadingGetProfile.value = true;
    try {
      final response = await profileService.getProfile();
      profileData.value = response.data;
    } catch (e) {
      if (e is ResponseProfileModel) {
        SnackbarUtils.show(
            messageText: e.message, type: AnimatedSnackBarType.error);
      }
    } finally {
      isLoadingGetProfile.value = false;
    }
  }

  Future<void> logoutUser() async {
    try {
      final response = await authenticationService.logout();
      if (response.success) {
        SnackbarUtils.show(
          messageText: response.message,
          type: AnimatedSnackBarType.success,
        );
      }
      SharedPref.removeToken();
      Get.offAllNamed(AppRoute.splash);
    } catch (e) {
      if (e is ResponseGlobalModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    }
  }
}
