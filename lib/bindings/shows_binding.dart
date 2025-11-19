import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/controllers/shows_controller.dart';

class ShowsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TableShow>(() => TableShow());
  }
}