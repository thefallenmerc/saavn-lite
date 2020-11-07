import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/helpers/shared_preference.dart';
import 'package:mobile/models/song_from_search.dart';
import 'package:mobile/services/http_service.dart';
import 'package:mobile/widgets/skeleton.dart';
import 'package:mobile/widgets/song_search_list_item.dart';

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
    prefs.getAccessToken().then((value) => {
          setState(() {
            token = int.parse(value);
          })
        });
    return Skeleton(
      child: Column(
        children: [
          buildSearchBar(context),
          Column(
            children: SongSearchListItem.fromList(searchResults),
          ),
          RaisedButton(
            onPressed: () {},
            color: Theme.of(context).primaryColor,
            child: Text("Increase!"),
          ),
        ],
      ),
    );
  }

  /// Build Seach bar
  Container buildSearchBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18),
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: _formKey,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                autocorrect: false,
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                var query = searchController.text;
                if (query.length > 0) {
                  setState(() {
                    isSearching = true;
                  });
                  http.search(query).then((results) {
                    setState(() {
                      searchResults = results;
                      isSearching = false;
                    });
                  }).catchError((error) {
                    print(error);
                    setState(() {
                      searchResults = [];
                      isSearching = false;
                    });
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
