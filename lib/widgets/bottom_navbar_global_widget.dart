import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';

class BottomNavbarGlobalWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;
  const BottomNavbarGlobalWidget({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.blackColor.withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: 5,
          ),
        ],
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: GNav(
        selectedIndex: selectedIndex,
        onTabChange: onTabChange,
        rippleColor: ColorConstant.secondaryColor,
        hoverColor: const Color(0XFFD6E9F9),
        haptic: true,
        tabBorderRadius: 44,
        duration: const Duration(milliseconds: 250),
        gap: 8,
        color: const Color(0XFF9DB2CE),
        activeColor: ColorConstant.primaryColor,
        iconSize: 24,
        tabBackgroundColor:const Color(0XFFD6E9F9),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        backgroundColor: ColorConstant.whiteColor,
        tabs: const [
          GButton(
            icon: LineIcons.home,
            text: 'Home',
          ),
          GButton(
            icon: LineIcons.users,
            text: 'Customer',
          ),
          // GButton(
          //   icon: LineIcons.map,
          //   text: 'Maps',
          // ),
          GButton(
            icon: LineIcons.user,
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}
