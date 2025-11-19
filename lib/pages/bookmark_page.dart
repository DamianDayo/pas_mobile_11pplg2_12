import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bookmark_controller.dart';

class BookmarkPage extends StatelessWidget {
  final bookmarkController = Get.put(BookmarkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bookmarks')),
      body: Obx(() {
        if (bookmarkController.bookmarks.isEmpty) {
          return Center(child: Text("No bookmarks yet"));
        }

        return ListView.builder(
          itemCount: bookmarkController.bookmarks.length,
          itemBuilder: (context, index) {
            final show = bookmarkController.bookmarks[index];
            return ListTile(
              leading: Image.network(show.image.medium),
              title: Text(show.name),
              subtitle: Text("Rating: ${show.rating.average ?? '-'}"),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  bookmarkController.toggleBookmark(show);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
