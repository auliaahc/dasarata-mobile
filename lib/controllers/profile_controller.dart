import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/models/profile/response_profile_model.dart';
import 'package:dasarata_mobile/services/profile_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool isLoadingProfile = RxBool(false);
  ProfileService profileService = ProfileService();
  Rxn<Data> profileData = Rxn<Data>();

  @override
  void onReady() {
    super.onReady();
    getProfileData();
  }

  Future<void> getProfileData() async {
    isLoadingProfile.value = true;
    try {
      final response = await profileService.getProfileData();
      profileData.value = response.data;
    } catch (e) {
      if (e is ResponseProfileModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error
        );
      }
    } finally {
      isLoadingProfile.value = false;
    }
  }
}
