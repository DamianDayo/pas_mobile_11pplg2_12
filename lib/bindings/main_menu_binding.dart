import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/controllers/main_menu_controller.dart';

class MainMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainMenuController>(() => MainMenuController());
  }
}