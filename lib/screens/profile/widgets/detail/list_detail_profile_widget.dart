import 'package:dasarata_mobile/screens/profile/widgets/detail/item_detail_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ListDetailProfileWidget extends StatelessWidget {
  const ListDetailProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        "icon": LineIcons.user,
        "label": "Nama Panggilan",
        "data": "John",
      },
      {
        "icon": LineIcons.phone,
        "label": "Nomor Telepon",
        "data": "6285738293847",
      },
      {
        "icon": LineIcons.at,
        "label": "Email",
        "data": "john@email.com",
      },
      {
        "icon": LineIcons.home,
        "label": "Alamat",
        "data": "Jl. Bunga Melati No. 19",
      },
      {
        "icon": LineIcons.briefcase,
        "label": "Divisi",
        "data": "Sales",
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
        bottom: 24
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
  }
}
