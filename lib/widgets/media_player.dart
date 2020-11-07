import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mobile/helpers/images.dart';
import 'package:mobile/models/song_detail.dart';
import 'package:mobile/state/main.dart';
import 'package:provider/provider.dart';

class MediaPlayer extends StatefulWidget {
  @override
  _MediaPlayerState createState() => _MediaPlayerState();
}

class _MediaPlayerState extends State<MediaPlayer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainState>(builder: (context, state, child) {
      final SongDetail song = state.nowPlaying;

      return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 5),
          ],
          color: ThemeData.dark().primaryColor,
        ),
        child: ListTile(
          leading: song is SongDetail
              ? CachedNetworkImage(
                  imageUrl: song.image,
                  placeholder: (context, url) => Image.asset(Images.icon),
                  errorWidget: (context, url, error) =>
                      Image.asset(Images.icon),
                )
              : Image.asset(Images.icon),
          title: Text(song is SongDetail ? song.song : "No song selected!"),
          subtitle: Text(song is SongDetail
              ? song.album + " - " + song.primaryArtists
              : "Please search and select one!"),
          trailing:
              song is SongDetail ? buildPlayPauseButton(state, context) : null,
        ),
      );
    });
  }

  IconButton buildPlayPauseButton(MainState state, BuildContext context) {
    return IconButton(
      icon: Icon(state.isPlaying ? Icons.pause : Icons.play_arrow, size: 32),
      onPressed: () async {
        state.isPlaying
            ? Provider.of<MainState>(context, listen: false).pause()
            : Provider.of<MainState>(context, listen: false).play();
      },
    );
  }
}