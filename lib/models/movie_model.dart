import 'package:app_movie/services/url.dart' as url;

class MovieModel {
  int? id;
  String? title;
  double? voteaverage;
  String? overview;
  String? posterPath;
  MovieModel(
      {required this.id,
      required this.title,
      this.voteaverage,
      this.overview,
      required this.posterPath});

  MovieModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson["title"];
    voteaverage = double.parse(parsedJson["voteaverage"].toString());
    overview = parsedJson["overview"];
    posterPath = "${url.BaseUrl}/${parsedJson["posterPath"]}";
  }
}
