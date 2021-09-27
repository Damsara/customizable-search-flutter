import 'package:customizable_search/helper/enums.dart';
import 'package:customizable_search/helper/screen_utils.dart';
import 'package:customizable_search/view_models/i_search_model.dart';
import 'package:customizable_search/view_models/search_model.dart';
import 'package:customizable_search/widgets/custom_loading.dart';
import 'package:customizable_search/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtils.setScreenSizes(context);
    return Scaffold(
      backgroundColor: Color(0xff1B1A26),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 40 , horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Search Screen' , style: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.bold),),
              _customTextField(),
              Consumer<SearchModel>(
                builder: (_, val, __) {
                  switch (val.states) {
                    case SearchScreenStates.EMPTY:
                      return Container();
                    case SearchScreenStates.LOADING:
                      return CustomLoadingBarrier(path: 'assets/animations/search.json');
                    case SearchScreenStates.SUCCESS:
                      return Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: ListView.builder(
                              itemCount: val.gameList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  child: SearchGameItem(
                                    releaseDate: val.gameList[index].released,
                                    title: val.gameList[index].name,
                                    imageUrl: val.gameList[index].image,
                                  ),
                                );
                              }),
                        ),
                      );
                    case SearchScreenStates.NOTHING:
                      return CustomLoadingBarrier(
                        path: 'assets/animations/search-failed.json',
                      );
                    case SearchScreenStates.FAILED:
                      return CustomLoadingBarrier(
                        path: 'assets/animations/error.json',
                      );
                    default:
                      return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _customTextField(){

    SearchModel model = Provider.of<SearchModel>(context, listen: false);
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Color(0xff07070B).withOpacity(0.4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ChangeNotifierProvider.value(
        value: model,
        child: TextFormField(
          style: TextStyle(
            color: Color(0x0FFC2B7CD),
            fontSize: 16,
          ),
          obscureText: false,
          keyboardType: TextInputType.text,
          onChanged: (val) {
            model.searchGames(val);
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
      ),
    );
  }
}
