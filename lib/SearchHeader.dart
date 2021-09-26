import 'package:customizable_search/screens/search_screen.dart';
import 'package:flutter/material.dart';

class SearchHeader extends StatefulWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  _SearchHeaderState createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Search',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SearchPage(),
    );
  }
}
