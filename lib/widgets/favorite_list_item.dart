import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/helpers/images.dart';
import 'package:mobile/models/song_from_search.dart';
import 'package:mobile/services/http_service.dart';
import 'package:mobile/state/main.dart';
import 'package:provider/provider.dart';

class FavoriteListItem extends StatelessWidget {
  final SongFromSearch song;

  FavoriteListItem(this.song);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CachedNetworkImage(
            imageUrl: song.image,
            placeholder: (context, url) => Image.asset(Images.icon),
            errorWidget: (context, url, error) => Image.asset(Images.icon),
          ),
        ),
      ),
      onTap: () async {
        // Play the song
        var http = GetIt.instance<HttpService>();

        final songDetails = await http.details(song.id);

        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Playing " + song.title),
        ));

        // set as now playing
        Provider.of<MainState>(context, listen: false).playSong(songDetails);
      },
      title: Text(song.title),
      subtitle: Text(song.album),
      trailing: IconButton(
        icon: Icon(Icons.favorite),
        color: Colors.red,
        onPressed: () {
          // Save the song
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Removed from favorite!"),
          ));

          Provider.of<MainState>(context, listen: false)
              .removeSongFromFavorite(song);
        },
      ),
    );
  }

  static List<Widget> fromList(List<SongFromSearch> songs) {
    return songs.map((e) => FavoriteListItem(e)).toList();
  }
}
