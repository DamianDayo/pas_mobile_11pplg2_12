import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/controllers/shows_controller.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/shows_widget.dart';

class ShowsPage extends StatelessWidget {
  ShowsPage({super.key});
  final controller = Get.find<ShowsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final shows = controller.showsResponse[index];
                return ShowsWidget(
                  image: shows.image,
                  name: shows.name,
                  genres: shows.genres,
                  rating: shows.rating,
                  text: "Bookmark",
                  onFavoriteTap: () {
                    controller.markFavoriteShows(index);
                  },
                );
              },
              itemCount: controller.showsResponse.length,
            ),
            onRefresh: () async {
              controller.fetchShows();
            },
          );
        }),
      ),
    );
  }
}