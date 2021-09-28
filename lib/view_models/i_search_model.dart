

import 'dart:async';

import 'package:customizable_search/helper/enums.dart';
import 'package:customizable_search/models/game_model.dart';
import 'package:customizable_search/services/http_service.dart';
import 'package:customizable_search/view_models/search_model.dart';

class ISearchModel extends SearchModel {

  List<GameDetails> _searchedGames = [];
  late SearchGame value;
  SearchScreenStates _screenStates = SearchScreenStates.EMPTY;
  Timer? _debounce;
  final _network = HttpService.shared;

  @override
  // TODO: implement gameList
  List<GameDetails> get gameList => _searchedGames;

  @override
  void searchGames(String name) {
    _screenStates = SearchScreenStates.LOADING;
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async{
      try{
        _searchedGames.clear();
        value = await _network.searchGame(name);
        if(value.data!.isEmpty){
          _screenStates = SearchScreenStates.NOTHING;
        }else{
          value.data!.forEach((element) {
            _searchedGames.add(element);
          });
          _screenStates = SearchScreenStates.SUCCESS;
        }
      }catch (error){
        _screenStates = SearchScreenStates.FAILED;
        print(error);
      }
      notifyListeners();
    });
    notifyListeners();
  }

  @override
  // TODO: implement states
  SearchScreenStates get states => _screenStates;
}