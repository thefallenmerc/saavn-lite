import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mobile/models/song_detail.dart';
import 'package:mobile/models/song_from_search.dart';

import 'package:get_it/get_it.dart';
import 'package:mobile/services/http_service.dart';

class MainState extends ChangeNotifier {
  final http = GetIt.instance<HttpService>();

  List songList;
  SongDetail nowPlaying;
  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  List<SongFromSearch> searchResults = [];

  // modifiers
  Future searchSongs(String query) async {
    try {
      List<SongFromSearch> results = await http.search(query);
      searchResults = results;
      notifyListeners();
      return true;
    } catch (error) {
      throw error;
    }
  }

  playSong(SongDetail songDetail) {
    nowPlaying = songDetail;
    player.setUrl(songDetail.mediaUrl).then((_) {
      notifyListeners();
    });
  }

  play() {
    isPlaying = true;
    notifyListeners();
    player.play();
  }

  pause() {
    isPlaying = false;
    notifyListeners();
    player.pause();
  }
}
