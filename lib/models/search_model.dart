import 'package:http/http.dart';
import 'dart:convert';

class SongData {
  final String id;
  final String title;
  final String author;
  final String? cover;
  final List<String> lyrics;

  const SongData({
    required this.title,
    required this.author,
    required this.cover,
    required this.id,
    required this.lyrics,
  });

  factory SongData.fromJson(Map<String, dynamic> json) {
    if (json['title'] == "Not Found") throw Exception("Song Not Found");

    try {
      return SongData(
        id: json['song_id'] as String,
        title: json['title'] as String,
        author: json['author'] as String,
        cover: json["cover"]?["url"] as String?,
        lyrics: List<String>.from(json['lyrics'] as List),
      );
    } catch (e) {
      throw FormatException('Failed to parse SongData: $e');
    }
  }
}

class SearchModel {
  Future<SongData> searchSong(String song, String author) async {
    final uri = Uri.parse(
      'https://sgrodolix.website/api/lyrics?t=$song&a=$author',
    );
    final response = await get(uri);

    if (response.statusCode != 200) {
      throw ('Failed to update resource');
    }

    return SongData.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
}
