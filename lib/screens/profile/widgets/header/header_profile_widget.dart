import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/screens/profile/widgets/header/name_nip_header_profile_widget.dart';
import 'package:dasarata_mobile/screens/profile/widgets/header/photo_header_profile_widget.dart';
import 'package:flutter/material.dart';

class HeaderProfileWidget extends StatelessWidget {
  const HeaderProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
        bottom: 48,
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const PhotoHeaderProfileWidget(),
            SpacingConstant.verticalSpacing12px,
            const NameNipHeaderProfileWidget(),
          ],
        ),
      ),
    );
  }
}