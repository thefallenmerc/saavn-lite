import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile/config/api_client.dart';
import 'package:mobile/helpers/shared_preference.dart';
import 'package:mobile/models/song_from_search.dart';

class Endpoints {
  static getSearchUrl(query) {
    return "https://www.jiosaavn.com/api.php?__call=autocomplete.get&_format=json&_marker=0&cc=in&includeMetaTags=1&query=$query";
  }
}

class HttpService {
  final APIClient client;
  final SharedPreferenceHelper prefs;

  HttpService(this.client, {this.prefs});

  Future<List<SongFromSearch>> search(String query) async {
    Response response = await client.get(Endpoints.getSearchUrl(query));
    var data = client.getJSONBody(response);
    var songsFromSearch = (data['songs']['data'] as List<dynamic>)
        .map((e) => SongFromSearch.fromJson(e))
        .toList();
    return songsFromSearch;
  }
}
