import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/controllers/splashscreen_controller.dart';

class SplashscreenPage extends StatelessWidget {
  
  SplashscreenPage({super.key});

  final controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),  
      ),
    );
  }
}