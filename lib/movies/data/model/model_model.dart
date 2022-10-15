import 'package:movies_app/movies/domain/entities/movies.dart';

class MovieModel extends Movie{
  MovieModel({
    required super.releaseDate,
    required super.id,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.title}
      );
 factory MovieModel.fromjson(Map<String,dynamic>json)=>MovieModel(
   releaseDate:json["release_date"],
     id: json["id"],
     backdropPath: json["backdrop_path"],
   genreIds: List<int>.from( json["genre_ids"].map((e) => e )),
     overview:  json["overview"],
     voteAverage:  json["vote_average"].toDouble(),
     title: json["title"],
 );



}