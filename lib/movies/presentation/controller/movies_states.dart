import 'package:equatable/equatable.dart';

import '../../../core/enume/enume.dart';
import '../../domain/entities/movies.dart';

class MoviesState extends Equatable{
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String message;
  ///popular
  final List<Movie> PopularMovies;
  final RequestState PopularState;
  final String messagePopular;
  ///TopRated
  final List<Movie> TopRatedMovies;
  final RequestState TopRatedState;
  final String messageTopRated;
  const MoviesState(
      {
    this.nowPlayingMovies= const [],
    this.nowPlayingState =RequestState.Loaded,
    this.message='',
        this.PopularMovies =const[],
        this.PopularState=RequestState.Loaded,
        this.messagePopular='',
        this.TopRatedMovies =const[],
        this.TopRatedState=RequestState.Loaded,
        this.messageTopRated='',
  });

  MoviesState CopyWith({
     List<Movie> ?nowPlayingMovies,
   RequestState? nowPlayingState,
    String ?message,
    ///popular
     List<Movie> ?PopularMovies,
     RequestState? PopularState,
    String ?messagePopular,
    ///TopRated
    List<Movie> ?TopRatedMovies,
    RequestState? TopRatedState,
    String ?messageTopRated,
}){
  return MoviesState(
      nowPlayingMovies:nowPlayingMovies??this.PopularMovies,
    nowPlayingState:nowPlayingState??this.nowPlayingState,
    message:message??this.message,
    ///popular
    PopularMovies:PopularMovies??this.PopularMovies,
    PopularState:PopularState??this.PopularState,
    messagePopular:messagePopular??this.messagePopular,
    ///TopRated
    TopRatedMovies:TopRatedMovies??this.TopRatedMovies,
    TopRatedState:PopularState??this.TopRatedState,
    messageTopRated:messagePopular??this.messageTopRated,
  );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [nowPlayingMovies,nowPlayingState,message,
    PopularMovies,PopularState,messagePopular,
    TopRatedMovies,TopRatedState,messageTopRated,
  ];
}