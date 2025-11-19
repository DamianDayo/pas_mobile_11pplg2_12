import 'dart:convert';

import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/database/db_helper.dart';
import 'package:pas_mobile_11pplg2_12/models/shows_model.dart';
import 'package:pas_mobile_11pplg2_12/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_12/reusable components/custom_color.dart';

class ShowsController extends GetxController {
  var isLoading = false.obs;
  var showsResponse = <ShowsModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchShows();
    fetchMarkShows();
  }

  void fetchShows() async {
    final url = Uri.parse("${Api.BASE_URL_SHOWS}/shows");

    try {
      isLoading.value = true;

      final res = await http.get(url);

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final List showsData = data;

        showsResponse.assignAll(
          showsData.map((e) => ShowsModel.fromJson(e)).toList(),
        );
      } else {
        Get.snackbar(
          "Informasi",
          "Gagal Mengambil Data",
          backgroundColor: AppColor.secondaryred,
          colorText: AppColor.neutrallight,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Informasi",
        e.toString(),
        backgroundColor: AppColor.secondaryred,
        colorText: AppColor.neutrallight,
      );
    } finally {
      isLoading.value = false;
    }
  }

  final db = DBHelper();
  void markFavoriteShows(int i) async {
    final findShows = showsResponse[i];
    print("Shows Data : ${findShows}");

    await db.markShows({
      'image': findShows.image,
      'name': findShows.name,
      'genres': findShows.genres,
      'rating': findShows.rating,
    });

    Get.snackbar(
      'Shows Pages',
      'Show berhasil di bookmark!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColor.secondarygreen,
      colorText: AppColor.neutrallight,
      duration: Duration(seconds: 1),
    );
    fetchMarkShows();
  }

  var showsMark = <ShowsModel>[].obs;

  void fetchMarkShows() async {
    final mapList = await db.getMarkShows();

    final list = mapList.map((row) => ShowsModel.fromDb(row)).toList();

    showsMark.assignAll(list);

    print("Data Marked: $showsMark");
  }

  void deleteMarkShows(int i) async {
    final shows = showsMark[i];

    await db.deleteShows(shows.id);

    Get.snackbar(
      'Shows Pages',
      'Show berhasil di hapus',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColor.secondarygreen,
      colorText: AppColor.neutrallight,
      duration: Duration(seconds: 1),
    );

    fetchMarkShows();
  }
}