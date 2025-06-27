import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sgrodolix_native/models/search_model.dart';

class SongViewModel extends ChangeNotifier {
  final SearchModel model = SearchModel();
  String? errorMessage;

  Future<SongData?> search(String song, String author) async {
    try {
      return await model.searchSong(song, author);
    } catch (e) {
      if (e.toString().contains("Not Found")) {
        errorMessage = 'Song not found.';
      } else {
        errorMessage = 'Something went wrong.';
      }

      notifyListeners();
      return null;
    }
  }
}
