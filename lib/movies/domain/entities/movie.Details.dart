import 'package:equatable/equatable.dart';

import 'Genreids.dart';

class MovieDetails extends Equatable{
  final String backdroppath;
  final String overview;
  final String releaseDate;
  final String title;
  final List<Genreids> genreIds;
  final double voteAverage;
  final int id;
  final int runtime;

  MovieDetails(
  {
  required   this.backdroppath,
    required  this.overview,
    required  this.releaseDate,
    required   this.title,
    required  this.genreIds,
    required   this.voteAverage,
    required   this.id,
    required this.runtime,
}
      );

  @override
  // TODO: implement props
  List<Object?> get props => [backdroppath,overview,releaseDate,title,genreIds,voteAverage,id,runtime];
}