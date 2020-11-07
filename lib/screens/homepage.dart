import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/helpers/shared_preference.dart';
import 'package:mobile/models/song_from_search.dart';
import 'package:mobile/services/http_service.dart';
import 'package:mobile/state/main.dart';
import 'package:mobile/widgets/favorite_list_item.dart';
import 'package:mobile/widgets/search_bar.dart';
import 'package:mobile/widgets/skeleton.dart';
import 'package:mobile/widgets/song_search_list_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static get route => MaterialPageRoute(builder: (_) => HomePage());

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int token = 1;
  bool isSearching = false;
  List<SongFromSearch> searchResults = [];

  TextEditingController searchController;
  HttpService http;
  SharedPreferenceHelper prefs;

  @override
  void initState() {
    searchController = TextEditingController();
    http = GetIt.instance<HttpService>();
    prefs = GetIt.instance<SharedPreferenceHelper>();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    // prefs.getAccessToken().then((value) => {
    //       setState(() {
    //         token = int.parse(value);
    //       })
    //     });
    return Consumer<MainState>(
      builder: (context, state, child) {
        return Skeleton(
          child: Column(
            children: [
              // Suggestions
              Column(
                children: SongSearchListItem.fromList(state.searchResults),
              ),
              // Saved Songs
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 9),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Favorites",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              state.songList.length > 0
                  ? Column(
                      children: FavoriteListItem.fromList(state.songList),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "No songs liked yet!",
                        style: TextStyle(color: Colors.white12),
                      ),
                    ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        );
      },
    );
  }
}
