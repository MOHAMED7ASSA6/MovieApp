import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failure/filure.dart';
import 'package:movies_app/movies/data/model/model_model.dart';
import 'package:movies_app/movies/domain/entities/Recommendation_movie.dart';
import 'package:movies_app/movies/domain/entities/movie.Details.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/usecase/get_Recommend_movie.dart';

import '../../../core/error/error_exception.dart';
import '../../domain/repository/movies_respository.dart';
import '../../domain/usecase/get_details_model.dart';
import '../data_source/remote_datasource.dart';

class MoviesRepository extends BaseMoviesRespository{
 final BaseMoviesRemoteDataScorce baseMoviesRemoteDataScorce;

  MoviesRepository(this.baseMoviesRemoteDataScorce);

  @override
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies()async {
  final result= await baseMoviesRemoteDataScorce.getNowPlayingMovies();
  try{
return Right(result)   ;
  }on ServerException catch(fialure){
return Left(ServerFilure(fialure.errorMessageModel.statusmessage));
  }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
   final result= await baseMoviesRemoteDataScorce.getPopularMovies();
   try{
    return Right(result)   ;
   }on ServerException catch(fialure){
    return Left(ServerFilure(fialure.errorMessageModel.statusmessage));
   }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
   final result= await baseMoviesRemoteDataScorce.getTopRatedMovies();
   try{
    return Right(result)   ;
   }on ServerException catch(fialure){
    return Left(ServerFilure(fialure.errorMessageModel.statusmessage));
   }
  }

  @override
  Future<Either<Failure, MovieDetails>> getDetailsMovies(MovieDetailsParmeter parmeter) async{
    final result= await baseMoviesRemoteDataScorce.getMovieDetails(parmeter);
    try{
      return Right(result)   ;
    }on ServerException catch(fialure){
      return Left(ServerFilure(fialure.errorMessageModel.statusmessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendationMovie(RecommendationPermeter parmeter) async{
    final result= await baseMoviesRemoteDataScorce.getRecommendation(parmeter);
    try{
      return Right(result)   ;
    }on ServerException catch(fialure){
      return Left(ServerFilure(fialure.errorMessageModel.statusmessage));
    }
  }
  }








