import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/controllers/profile_controller.dart';
import 'package:pas_mobile_11pplg2_12/pages/profile_page.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {

    if (!Get.isRegistered<ProfileController>()) {
      Get.put(ProfileController());
    }

    return ProfilePage();
  }
}