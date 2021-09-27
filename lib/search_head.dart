import 'package:customizable_search/screens/search_screen.dart';
import 'package:customizable_search/view_models/i_search_model.dart';
import 'package:customizable_search/view_models/search_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchHead extends StatefulWidget {
  const SearchHead({Key? key}) : super(key: key);

  @override
  _SearchHeadState createState() => _SearchHeadState();
}

class _SearchHeadState extends State<SearchHead> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Search',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChangeNotifierProvider<SearchModel>(
        create: (context) => ISearchModel(),
          child: SearchPage()),
    );
  }
}
