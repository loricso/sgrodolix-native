import 'package:flutter/foundation.dart';
import 'package:sgrodolix_native/models/search_model.dart';

class SongViewModel extends ChangeNotifier {
  final SearchModel model;
  SongData? data;
  String? errorMessage;
  SongViewModel(this.model);

  Future<void> search(String song, String author) async {
    try {
      data = (await model.searchSong(song, author));
    } catch (e) {
      if (e.toString().contains("Not Found")) {
        errorMessage = 'Song not found.';
      } else {
        errorMessage = 'Something went wrong.';
      }
    }
    notifyListeners();
  }
}
