import 'package:flutter/foundation.dart';

class MainState extends ChangeNotifier {
  List songList;
  // modifiers
  Future searchSongs() async {
    notifyListeners();
  }
}
