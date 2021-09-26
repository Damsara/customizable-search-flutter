

import 'package:customizable_search/helper/enums.dart';
import 'package:customizable_search/models/game_model.dart';
import 'package:flutter/cupertino.dart';

abstract class SearchModel with ChangeNotifier{

  List<GameDetails> get gameList;

  void searchGames(String name);

  SearchScreenStates get states;

}