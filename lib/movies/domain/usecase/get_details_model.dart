import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies_app/core/failure/filure.dart';

import '../../../core/BaseUseCase/usecase.dart';

import '../entities/movie.Details.dart';
import '../repository/movies_respository.dart';

class GetDetailsMoviesUseCase extends UseCase<MovieDetails,MovieDetailsParmeter>{
  final BaseMoviesRespository baseMoviesRespository;

  GetDetailsMoviesUseCase(this.baseMoviesRespository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParmeter parmeter)async {
    return await baseMoviesRespository.getDetailsMovies(parmeter);

  }
}
class MovieDetailsParmeter extends Equatable{
final int  movieId;

const  MovieDetailsParmeter({
  required this.movieId,

});

  @override

  List<Object?> get props => [movieId];

}