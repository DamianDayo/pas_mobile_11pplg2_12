import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/shows_model.dart';
import 'dart:convert';

class BookmarkController extends GetxController {
  var bookmarks = <Shows>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadBookmarks();
  }

  Future<void> loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('bookmarks');

    if (saved != null) {
      List<dynamic> jsonList = jsonDecode(saved);
      bookmarks.value = jsonList.map((e) => Shows.fromJson(e)).toList();
    }
  }

  Future<void> toggleBookmark(Shows show) async {
    final prefs = await SharedPreferences.getInstance();

    if (isBookmarked(show.id)) {
      bookmarks.removeWhere((e) => e.id == show.id);
    } else {
      bookmarks.add(show);
    }

    prefs.setString(
      'bookmarks',
      jsonEncode(bookmarks.map((e) => e.toJson()).toList()),
    );

    bookmarks.refresh();
  }

  bool isBookmarked(int id) {
    return bookmarks.any((e) => e.id == id);
  }
}