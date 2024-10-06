import 'package:dasarata_mobile/screens/home/widgets/header_home_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          HeaderHomeWidget(),
        ],
      )),
    );
  }
}
