import 'package:dasarata_mobile/screens/home/home_screen.dart';
import 'package:dasarata_mobile/widgets/bottom_navbar_global_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: BottomNavbarGlobalWidget(),
    );
  }
}
