import 'package:movies_app/movies/domain/entities/Genreids.dart';

import '../../domain/entities/movie.Details.dart';
import 'genreModel.dart';

class DetailsModel extends MovieDetails{
  DetailsModel({
    required super.backdroppath,
    required super.overview,
    required super.releaseDate,
    required super.title,
    required super.genreIds,
    required super.voteAverage,
    required super.id,
    required super.runtime
  });
  factory DetailsModel.fromjson(Map<String, dynamic >json)=>DetailsModel(
  backdroppath:json["backdrop_path"],
  releaseDate:json["release_date"],
  id: json["id"],
  genreIds: List<GenreModel>.from( json["genres"].map((e) => GenreModel.fromjson(e) )),
  overview:  json["overview"],
  voteAverage:  json["vote_average"].toDouble(),
  title: json["title"],
    runtime: json["runtime"],
  );


}