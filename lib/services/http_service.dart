import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile/config/api_client.dart';
import 'package:mobile/helpers/shared_preference.dart';
import 'package:mobile/models/song_detail.dart';
import 'package:mobile/models/song_from_search.dart';

class Endpoints {
  static String getSearchUrl(query) {
    return "https://www.jiosaavn.com/api.php?__call=autocomplete.get&_format=json&_marker=0&cc=in&includeMetaTags=1&query=$query";
  }

  static String getDetailUrl(String id) {
    return "https://www.jiosaavn.com/api.php?__call=song.getDetails&cc=in&_marker=0%3F_marker%3D0&_format=json&pids=$id";
  }
}

class HttpService {
  final APIClient client;
  final SharedPreferenceHelper prefs;

  HttpService(this.client, {this.prefs});

  /// Search a song
  Future<List<SongFromSearch>> search(String query) async {
    Response response = await client.get(Endpoints.getSearchUrl(query));
    var data = client.getJSONBody(response);
    var songsFromSearch = (data['songs']['data'] as List<dynamic>)
        .map((e) => SongFromSearch.fromJson(e))
        .toList();
    return songsFromSearch;
  }

  /// Get details of a song
  Future<SongDetail> details(String id) async {
    Response response = await client.get(Endpoints.getDetailUrl(id));
    final data = client.getJSONBody(response);
    final songMap = data[id];
    // check if has media_preview_url
    if (songMap['media_preview_url'] != null) {
      // format the song
      // get the media url
      songMap['media_url'] =
          (songMap['media_preview_url'] as String).replaceAll('preview', 'aac');
      // if it has 320kbps
      if (songMap['320kbps'] == "true") {
        // get 320kbps
        songMap['media_url'] =
            songMap['media_url'].replaceAll("_96_p.mp4", "_320.mp4");
      } else {
        // if not, get _160
        songMap['media_url'] =
            songMap['media_url'].replaceAll("_96_p.mp4", "_160.mp4");
      }
      // get 500p album art
      songMap['image_500'] =
          (songMap['image'] as String).replaceAll('150x150', '500x500');
      // format the song end
      final song = SongDetail.fromJson(songMap);

      return song;
    } else {
      return null;
    }
  }
}
