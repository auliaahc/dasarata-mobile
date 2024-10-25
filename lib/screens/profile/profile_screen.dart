import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/controllers/dashboard_customer_controller.dart';
import 'package:dasarata_mobile/controllers/main_controller.dart';
import 'package:dasarata_mobile/controllers/profile_controller.dart';
import 'package:dasarata_mobile/screens/profile/widgets/detail/list_detail_profile_widget.dart';
import 'package:dasarata_mobile/screens/profile/widgets/header/header_profile_widget.dart';
import 'package:dasarata_mobile/widgets/appbar_global_widget.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.find();
    final ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      appBar: AppbarGlobalWidget(
        title: "Profile",
        action: const Icon(Icons.exit_to_app_rounded),
        onPressedAction: () => mainController.logout(),
      ),
      backgroundColor: ColorConstant.whiteColor,
      body: Obx(
        () {
          if (profileController.isLoadingProfile.value || profileController.profileData.value == null) {
            return const Center(
              child: LoadingAnimationGlobalWidget(),
            );
          } else {
            return const SingleChildScrollView(
              child: Column(
                children: [
                  HeaderProfileWidget(),
                  ListDetailProfileWidget(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
