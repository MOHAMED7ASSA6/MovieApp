
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/enume/enume.dart';
import 'package:movies_app/movies/domain/entities/Recommendation_movie.dart';

import '../../domain/entities/movie.Details.dart';
import '../../domain/usecase/get_Recommend_movie.dart';
import '../../domain/usecase/get_details_model.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getDetailsMoviesUseCase,  this.getRecommendationMovie, ) : super( const MovieDetailsState()) {

    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRommendationEvent>(_getRecommendation);
  }
  final GetDetailsMoviesUseCase getDetailsMoviesUseCase;
  final  GetRecommendationMovieUseCase getRecommendationMovie;
  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit)async {
 final result= await  getDetailsMoviesUseCase(MovieDetailsParmeter(movieId: event.id, ));
 result.fold((l) => emit(state.CopyWith(
   moviedetailState: RequestState.error,
     moviedetailmessage:l.message,
 )),
         (r) => emit(state.CopyWith(
           movieDetail: r,
           moviedetailState: RequestState.Loaded,
         )));
  }

  FutureOr<void> _getRecommendation(GetMovieRommendationEvent event, Emitter<MovieDetailsState> emit) async{
    final result= await  getRecommendationMovie(RecommendationPermeter(event.id, ));
    result.fold((l) => emit(state.CopyWith(
      movieRecommendationState: RequestState.error,
      Recommendationmessage:l.message,
    )),
            (r) => emit(state.CopyWith(
          movieRecommendation: r,
          movieRecommendationState: RequestState.Loaded,
        )));
  }
}
