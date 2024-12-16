import 'package:dasarata_mobile/controllers/profile_controller.dart';
import 'package:dasarata_mobile/screens/profile/widgets/detail/item_detail_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ListDetailProfileWidget extends StatelessWidget {
  const ListDetailProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();
    return Obx(
      () {
        final List<Map<String, dynamic>> data = [
          {
            "icon": LineIcons.user,
            "label": "Nama Panggilan",
            "data": profileController.profileData.value!.name == ""
                ? "-"
                : profileController.profileData.value!.name,
          },
          {
            "icon": LineIcons.phone,
            "label": "Nomor Telepon",
            "data": profileController.profileData.value!.phone == ""
                ? "-"
                : profileController.profileData.value!.phone,
          },
          {
            "icon": LineIcons.at,
            "label": "Email",
            "data": profileController.profileData.value!.email == ""
                ? "-"
                : profileController.profileData.value!.email,
          },
          {
            "icon": LineIcons.home,
            "label": "Alamat",
            "data": profileController.profileData.value!.address == ""
                ? "-"
                : profileController.profileData.value!.address,
          },
          {
            "icon": LineIcons.briefcase,
            "label": "Divisi",
            "data": profileController.profileData.value!.division == ""
                ? "-"
                : profileController.profileData.value!.division,
          },
        ];
        return ListView.builder(
          itemCount: data.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            left: 36,
            top: 24,
            right: 26,
            bottom: 24,
          ),
          itemBuilder: (context, index) {
            final detailProfile = data[index];
            return ItemDetailProfileWidget(
              icon: detailProfile["icon"],
              label: detailProfile["label"],
              data: detailProfile["data"],
            );
          },
        );
      },
    );
  }
}
