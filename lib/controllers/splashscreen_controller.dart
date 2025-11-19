import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pas_mobile_11pplg2_12/routes/routes.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startSplash();
  }

  Future<void> _startSplash() async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Get.offAllNamed(AppRoutes.mainMenuPage);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}