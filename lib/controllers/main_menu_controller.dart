import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/fragments/shows_fragment.dart';
import 'package:pas_mobile_11pplg2_12/fragments/bookmark_fragment.dart';
import 'package:pas_mobile_11pplg2_12/fragments/profile_fragment.dart';

class MainMenuController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    ShowsFragment(),
    BookmarkFragment(),
    ProfileFragment(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}