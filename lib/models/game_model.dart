
class SearchGame {
  List<GameDetails>? _data;

  SearchGame.fromJson(Map<String, dynamic> json) {
    _data = json['results'] == null
        ? null
        : List<GameDetails>.from(json['results'].map((games) => GameDetails.fromJson(games)));
  }

  List<GameDetails>? get data => _data;
}

class GameDetails {
  String? name;
  String? released;
  String? image;
  int? id;

  GameDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'] == null ? null : json['name'];
    released = json['released'] == null ? null : json['released'];
    image = json['background_image'] == null ? null : json['background_image'];
    id = json['id'] == null ? null : json['id'];
    // genres = json['results'] == null ? null : List<Genres>.from(json['results'].map((games) => Genres.fromJson(games)));
  }
  GameDetails({this.name, this.released, this.image, this.id});
}