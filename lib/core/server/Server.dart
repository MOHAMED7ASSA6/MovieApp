import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/remote_datasource.dart';
import 'package:movies_app/movies/data/repository/movie_respository.dart';
import 'package:movies_app/movies/domain/repository/movies_respository.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies_country.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

import '../../movies/domain/usecase/get_Recommend_movie.dart';
import '../../movies/domain/usecase/get_TopRated_movies_country.dart';
import '../../movies/domain/usecase/get_details_model.dart';
import '../../movies/domain/usecase/get_plauing_movies_country.dart';
import '../../movies/presentation/controller/movie_details_bloc.dart';
final getIt = GetIt.instance;
class ServicesLocator{

void init(){
  
  
  /// bloc
  getIt.registerFactory(() => MoviesBloc(getIt(),getIt(),getIt(),));
  getIt.registerFactory(() => MovieDetailsBloc(getIt(),getIt()));
  ///UseCASE
  getIt.registerLazySingleton(() => GetPlayingMoviesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetPopularMoviesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetTopRateMoviesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetDetailsMoviesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetRecommendationMovieUseCase(getIt()));
  ///Repository
  getIt.registerLazySingleton<BaseMoviesRespository>(() => MoviesRepository(getIt()));

  ///dataSource
  getIt.registerLazySingleton<BaseMoviesRemoteDataScorce>(() =>MoviesRemoteDataScorce());
}


}