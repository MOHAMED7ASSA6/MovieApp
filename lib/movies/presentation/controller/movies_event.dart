import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable{
  const  MoviesEvent();

  @override
  List<Object> get props =>[];


}

class GetNowPlayinEventMovies extends MoviesEvent{}
class GetNowPopularEventMovies extends MoviesEvent{}
class GetNowTopEventMovies extends MoviesEvent{}