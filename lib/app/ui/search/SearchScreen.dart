import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:solyric_app/app/utils/Resources.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController editingController = TextEditingController();
  final duplicateItems = List<String>.generate(100, (i) => "Music $i");
  var items = List<String>();
  FocusNode _focus = new FocusNode();
  var isTyping = false;

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    debugPrint("Focus: " + _focus.hasFocus.toString());

    setState(() {
      isTyping = _focus.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                focusNode: _focus,
                // textAlign: TextAlign.center,
                onChanged: (value) {
                  FilterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(8.0),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search",
                    prefixIcon: AnimatedContainer(
                      padding: isTyping ? null : EdgeInsets.only(right: 4),
                      width: isTyping ? 0 : width / 2.75,
                      child: Row(
                        mainAxisAlignment: isTyping
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.search,
                          )
                        ],
                      ),
                      duration: Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide.none)),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => Container(
                  child: ListTile(
                    title: Text('${items[index]}',
                        style: TextStyle(color: Colors.white)),
                  ),
                  decoration: new BoxDecoration(
                      border: new Border(
                    bottom: new BorderSide(color: Colors.white),
                    // top: new BorderSide(color: Colors.white),
                  ))),
            ))
          ],
        ),
      ),
    );
  }

  void FilterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
        setState(() {
          items.clear();
          items.addAll(dummyListData);
        });
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }
}
