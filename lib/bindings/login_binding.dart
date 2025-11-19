import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(), permanent: true);
  }
}