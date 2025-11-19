import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/controllers/authentification_controller.dart';

class AuthentificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthentificationController>(() => AuthentificationController());
  }
}