part of 'movie_details_bloc.dart';


 class MovieDetailsState extends Equatable {
  const MovieDetailsState({
   this.movieDetails,
    this.moviedetailState =RequestState.Loading,
   this.moviedetailmessage='',
   ///Rec
   this.movieRecommendation=const[],
   this.movieRecommendationState =RequestState.Loading,
   this.Recommendationmessage='',

  });

  final MovieDetails? movieDetails;
  final RequestState moviedetailState;
  final String moviedetailmessage;
  ///Recommendation
  final List<Recommendation> movieRecommendation;
  final RequestState movieRecommendationState;
  final String Recommendationmessage;

  MovieDetailsState CopyWith({
    MovieDetails? movieDetail,
    RequestState? moviedetailState,
    String ?moviedetailmessage,
   ///Recommendation
    List<Recommendation>? movieRecommendation,
    RequestState? movieRecommendationState,
    String? Recommendationmessage,
  }){
   return MovieDetailsState(
    movieDetails:movieDetail??this.movieDetails,
    moviedetailState:moviedetailState??this.moviedetailState,
    moviedetailmessage:moviedetailmessage??this.moviedetailmessage,
    ///Recommendation
    movieRecommendation:movieRecommendation??this.movieRecommendation,
    movieRecommendationState:movieRecommendationState??this.movieRecommendationState,
    Recommendationmessage:Recommendationmessage??this.Recommendationmessage,
   );
  }
  @override
  List<Object?> get props =>[movieDetails,moviedetailState,moviedetailmessage,movieRecommendation,movieRecommendationState,Recommendationmessage];





  ///Recommendation





}



