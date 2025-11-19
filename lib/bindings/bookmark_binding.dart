import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/controllers/bookmark_controller.dart';

class BookmarkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookmarkController>(() => BookmarkController());
  }
}