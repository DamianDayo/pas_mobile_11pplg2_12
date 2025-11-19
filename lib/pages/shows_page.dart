import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/controllers/shows_controller.dart';
import 'package:pas_mobile_11pplg2_12/controllers/bookmark_controller.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/shows_widget.dart';

class ShowsPage extends StatelessWidget {
  ShowsPage({super.key});

  final TableShow controller = Get.put(TableShow());
  final BookmarkController bookmark = Get.put(BookmarkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Shows")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: () async {
            controller.fetchAPITableShow();
          },
          child: ListView.builder(
            itemCount: controller.tableStandings.length,
            itemBuilder: (context, index) {
              final show = controller.tableStandings[index];
              final isBookmarked = bookmark.isBookmarked(show.id);

              return ShowsWidget(
                image: show.image.original,
                name: show.name,
                genres: show.genres.join(", "),
                rating: show.rating.average?.toString() ?? "0",

                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: isBookmarked ? Colors.amber : Colors.grey,
                ),

                onBookmarkTap: () => bookmark.toggleBookmark(show),
              );
            },
          ),
        );
      }),
    );
  }
}