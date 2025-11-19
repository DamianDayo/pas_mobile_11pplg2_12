import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pas_mobile_11pplg2_12/routes/pages.dart';
import 'package:pas_mobile_11pplg2_12/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final username = prefs.getString("username");
  final isLoggedIn = username != null;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute:
          isLoggedIn ? AppRoutes.splashscreenPage : AppRoutes.loginPage,
      getPages: AppPages.pages,
    );
  }
}