import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B1A26),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 40 , horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Search Screen' , style: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.bold),),
              _customTextField()
            ],
          ),
        ),
      ),
    );
  }

  Widget _customTextField(){
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Color(0xff07070B).withOpacity(0.4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        style: TextStyle(
          color: Color(0x0FFC2B7CD),
          fontSize: 16,
        ),
        obscureText: false,
        keyboardType: TextInputType.text,
        onChanged: (val) {

        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          hintText: 'Search here...',
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Color(0xff07070B).withOpacity(0.4),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.only(left: 12.0, top: 20, bottom: 20),
        ),
      ),
    );
  }
}
