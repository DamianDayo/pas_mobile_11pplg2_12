import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/controllers/shows_controller.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/custom_color.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/shows_widget.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({super.key});
  final controller = Get.find<ShowsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.showsMark.isEmpty) {
            return Center(
              child: Text(
                "Belum ada show dibookmark",
                style: TextStyle(
                  color: AppColor.primaryblue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              controller.fetchMarkShows();
            },
            child: ListView.builder(
              itemCount: controller.showsMark.length,
              itemBuilder: (context, index) {
                final shows = controller.showsMark[index];

                return ShowsWidget(
                  image: shows.image,
                  name: shows.name,
                  genres: shows.genres,
                  rating: shows.rating,
                  text: "Hapus",
                  buttonCollor: AppColor.secondaryred,
                  prefixIcon: Icon(Icons.delete, color: AppColor.neutrallight),
                  onFavoriteTap: () {
                    controller.deleteMarkShows(index);
                  },
                );
              },
            ),
          );
        }),
      ),
    );
  }
}