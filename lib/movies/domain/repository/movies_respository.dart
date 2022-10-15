import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';

import '../../../core/failure/filure.dart';
import '../entities/Recommendation_movie.dart';
import '../entities/movie.Details.dart';
import '../usecase/get_Recommend_movie.dart';
import '../usecase/get_details_model.dart';

abstract class BaseMoviesRespository{
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
  Future<Either<Failure,MovieDetails>> getDetailsMovies(MovieDetailsParmeter parmeter);
  Future<Either<Failure,List<Recommendation>>> getRecommendationMovie(
      RecommendationPermeter parmeters,
      );


}