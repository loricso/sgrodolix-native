import 'package:http/http.dart';
import 'dart:convert';

class LyricsModel {
  Future searchSong(String song, String author) async {
    final uri = Uri.parse(
      'https://sgrodolix.website/api/lyrics?t=$song&a=$author',
    );
    final response = await get(uri);

    if (response.statusCode != 200) {
      throw ('Failed to update resource');
    }

  }
}

