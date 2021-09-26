

import 'dart:async';

import 'package:customizable_search/helper/enums.dart';
import 'package:customizable_search/models/game_model.dart';
import 'package:customizable_search/view_models/search_model.dart';

class ISearchModel extends SearchModel {

  List<GameDetails> _searchedGames = [];
  late SearchGame value;
  SearchScreenStates _screenStates = SearchScreenStates.EMPTY;
  Timer? _debounce;

  @override
  // TODO: implement gameList
  List<GameDetails> get gameList => _searchedGames;

  @override
  void searchGames(String name) {
    
  }

  @override
  // TODO: implement states
  SearchScreenStates get states => _screenStates;



}