import 'dart:math';

import 'package:dio/dio.dart';
import 'package:movies_app/core/error/error_exception.dart';
import 'package:movies_app/core/utills/constances.dart';
import '../../../core/api_code/apis.dart';
import '../../../core/network/error_massage.dart';

import '../../domain/usecase/get_Recommend_movie.dart';
import '../../domain/usecase/get_details_model.dart';
import '../model/RecommandationModel.dart';
import '../model/model_model.dart';
import '../model/movie_details_model.dart';
//بتتعمل لم تحب تعمل تعاقد مع get
abstract class BaseMoviesRemoteDataScorce {
  Future<List<MovieModel>>getNowPlayingMovies();
  Future<List<MovieModel>>getPopularMovies();
  Future<List<MovieModel>>getTopRatedMovies();
  Future<DetailsModel>getMovieDetails(MovieDetailsParmeter parmeter);
  Future<List<RecommendationModel>>getRecommendation(RecommendationPermeter parmeter);


}
class MoviesRemoteDataScorce extends BaseMoviesRemoteDataScorce{
  @override
 Future<List<MovieModel>> getNowPlayingMovies()async{
    final Response =await Dio().get(
       "${ApisConstance.nowPlayingMovies}");
    print(Response);

    if (Response.statusCode==200){
     return List<MovieModel>.from((Response.data["results"] as List).
      map((e) => MovieModel.fromjson(e)));
    }else {
      throw ServerException(
          errorMessageModel:ErrorMessageModel.fromjson(Response.data) );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies()async {
  final Response=await Dio().get("${ApisConstance.nowPopularMovies}");
  if(Response.statusCode==200){
  return  List<MovieModel>.from((Response.data["results"] as List).
    map((e) => MovieModel.fromjson(e)));
  }else{
    throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(Response.data));
  }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies()async {
   final Response=await Dio().get("${ApisConstance.baseurl}/movie/top_rated?api_key=${ApisConstance.apikey}");
   if(Response.statusCode==200){
     return  List<MovieModel>.from((Response.data["results"] as List).
     map((e) => MovieModel.fromjson(e)));
   }else{
     throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(Response.data));
   }

  }

  @override
  Future<DetailsModel> getMovieDetails(MovieDetailsParmeter parmeter) async{
    final Response =await Dio().get(
        "${ApisConstance.DetailsMovies(parmeter.movieId)}");
    if (Response.statusCode==200){
      return DetailsModel.fromjson(Response.data);
    }else {
      throw ServerException(
          errorMessageModel:ErrorMessageModel.fromjson(Response.data) );
    }
    

  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationPermeter parmeter) async{
    final Response =await Dio().get(
        "${ApisConstance.RecommendationMovie(parmeter.id)}");


    if (Response.statusCode==200){
      return List<RecommendationModel>.from((Response.data["results"] as List).
      map((e) => RecommendationModel.fromjson(e)));
    }else {
      throw ServerException(
          errorMessageModel:ErrorMessageModel.fromjson(Response.data) );
    }

  }



}