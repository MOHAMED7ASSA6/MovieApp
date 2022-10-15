
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';

import '../../../core/BaseUseCase/usecase.dart';
import '../../../core/enume/enume.dart';
import '../../domain/usecase/get_TopRated_movies_country.dart';
import '../../domain/usecase/get_plauing_movies_country.dart';
import '../../domain/usecase/get_popular_movies_country.dart';
import 'movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState>{

  final GetPlayingMoviesUseCase getPlayingMoviesUseCase;
  final  GetPopularMoviesUseCase getPopularMoviesUseCase;
  final  GetTopRateMoviesUseCase getTopRateMoviesUseCase;
  MoviesBloc(this.getPlayingMoviesUseCase,this.getPopularMoviesUseCase,
      this.getTopRateMoviesUseCase):super(const MoviesState()){
    on<GetNowPlayinEventMovies>(_getNowPlayingMovies);
    on<GetNowPopularEventMovies>(_getPopularMovies);
    on<GetNowTopEventMovies>(_getTopRatedMovies);



  }


  FutureOr<void> _getNowPlayingMovies(GetNowPlayinEventMovies event, Emitter<MoviesState> emit)async {

    final result= await getPlayingMoviesUseCase(noParmeter());
    print(result);

    result.fold((l) =>emit (
        state.CopyWith(
          nowPlayingState:RequestState.error,
          messagePopular:l.message,
        )
    ), (r) => emit(
        state.CopyWith(
          nowPlayingState:RequestState.Loaded,
          nowPlayingMovies:r,
        )


    ));
  }

  FutureOr<void> _getPopularMovies(GetNowPopularEventMovies event, Emitter<MoviesState> emit) async{
    final results = await getPopularMoviesUseCase(noParmeter());
    results.fold((l) =>emit (
        state.CopyWith(
          PopularState:RequestState.error,
          messagePopular:l.message,
        )
    ), (r) => emit(
        state.CopyWith(
          PopularState:RequestState.Loaded,
          PopularMovies:r,
        )


    ));
  }

  FutureOr<void> _getTopRatedMovies(GetNowTopEventMovies event, Emitter<MoviesState> emit) async{
    final results = await getTopRateMoviesUseCase(noParmeter());
    results.fold((l) =>emit (
        state.CopyWith(
          TopRatedState:RequestState.error,
          messageTopRated:l.message,
        )
    ), (r) => emit(
        state.CopyWith(
          TopRatedState:RequestState.Loaded,
          TopRatedMovies:r,
        )


    ));
  }

}