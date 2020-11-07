import 'package:flutter/material.dart';
import 'package:mobile/state/main.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController searchController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainState>(builder: (context, state, child) {
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
                  onTap: () {
                    Provider.of<MainState>(context, listen: false)
                        .clearSearch();
                  },
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
              // Search Button
              state.isSearching
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      width: 40,
                      height: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : state.searchResults.length > 0
                      ? IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            searchController.text = "";
                            Provider.of<MainState>(context, listen: false)
                                .clearSearch();
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            var query = searchController.text;
                            if (query.length > 0) {
                              Provider.of<MainState>(context, listen: false)
                                  .searchSongs(query);
                            }
                          },
                        ),
            ],
          ),
        ),
      );
    });
  }
}
