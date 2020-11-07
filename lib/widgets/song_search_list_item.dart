import 'package:flutter/material.dart';
import 'package:mobile/models/song_from_search.dart';

class SongSearchListItem extends StatelessWidget {
  final SongFromSearch song;

  SongSearchListItem(this.song);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            song.image,
          ),
        ),
      ),
      title: Text(song.title),
      subtitle: Text(song.album),
    );
  }

  static List<Widget> fromList(List<SongFromSearch> songs) {
    return songs.map((e) => SongSearchListItem(e)).toList();
  }
}
