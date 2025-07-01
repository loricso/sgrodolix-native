import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sgrodolix_native/models/search_model.dart';

class SongViewModel extends ChangeNotifier {
  final SearchModel model = SearchModel();

  SongData? data;
  String? errorMessage;
  bool isLoading = false;

  Future<void> search(String song, String author) async {
    isLoading = true;
    notifyListeners();

    try {
      data = await model.searchSong(song, author);
      errorMessage = null;
    } catch (e) {
      data = null;
      if (e.toString().contains("Not Found")) {
        errorMessage = 'Song not found.';
      } else {
        errorMessage = 'Something went wrong.';
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
