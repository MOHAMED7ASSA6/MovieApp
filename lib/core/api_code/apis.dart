class ApisConstance{

  static String baseurl="https://api.themoviedb.org/3";
  static String apikey="95127df0480595e636550428798a9797";

  static String nowPlayingMovies="$baseurl/movie/now_playing?api_key=$apikey";
  static String nowPopularMovies="$baseurl/movie/popular?api_key=$apikey";
  static String nowTopRatedMovies="$baseurl/movie/top_rated?api_key=$apikey";

  static String DetailsMovies(int movieId)=>"$baseurl/movie/$movieId?api_key=$apikey";

  static String RecommendationMovie(int movieId)=>"$baseurl/movie/$movieId/recommendations?api_key=$apikey";



 // static String urlimage='$baseurl/movie/now_playing?api_key=$apikey';

  static const String baseUrlimage='https://image.tmdb.org/t/p/w500';
  static  String imageUrl(String path)=>'$baseUrlimage$path';



}