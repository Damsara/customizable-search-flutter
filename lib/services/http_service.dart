
import 'dart:convert';

import 'package:http/http.dart';
import 'package:customizable_search/models/game_model.dart';

class HttpService{

  HttpService._privateConstructor();
  static final HttpService _instance = HttpService._privateConstructor();
  static HttpService get shared => _instance;

  final String baseUrl = 'https://api.rawg.io/api';
  final String API_KEY = 'ADD API KEY';

  Client client = Client();

  Map<String, String> _headers = {
    "User-Agent": 'ADD YOUR COMPANY',
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };


  Future<SearchGame> searchGame(String name) async{
    Response response;
    var url = '$baseUrl' + '/games?page=1&search=$name' + '&key=$API_KEY';

    response = await client.get(Uri.parse(url), headers: _headers);

    if(response.statusCode == 200){
      return SearchGame.fromJson(json.decode(response.body));
    }else{
      throw (e){
        return e;
      };
    }
  }


}