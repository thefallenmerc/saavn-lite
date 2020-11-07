import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mobile/models/song_detail.dart';
import 'package:mobile/models/song_from_search.dart';

import 'package:get_it/get_it.dart';
import 'package:mobile/services/http_service.dart';

class MainState extends ChangeNotifier {
  final http = GetIt.instance<HttpService>();

  List<SongFromSearch> songList = [];
  SongDetail nowPlaying;
  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  bool isSearching = false;
  List<SongFromSearch> searchResults = [];

  // modifiers
  Future searchSongs(String query) async {
    try {
      isSearching = true;
      notifyListeners();
      List<SongFromSearch> results = await http.search(query);
      searchResults = results;
      isSearching = false;
      notifyListeners();
      return true;
    } catch (error) {
      isSearching = false;
      notifyListeners();
      throw error;
    }
  }

  clearSearch() {
    if (searchResults.length > 0) {
      searchResults = [];
      notifyListeners();
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

  addSongToFavorite(SongFromSearch song) {
    // check if already there
    if (!songList.contains(song)) {
      songList.add(song);
      // add to localstorage too
      notifyListeners();
    }
  }

  removeSongFromFavorite(SongFromSearch song) {
    if (songList.remove(song)) {
      notifyListeners();
    }
  }
}
