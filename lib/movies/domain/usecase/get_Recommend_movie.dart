import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/BaseUseCase/usecase.dart';
import 'package:movies_app/core/failure/filure.dart';
import 'package:movies_app/movies/domain/entities/Recommendation_movie.dart';
import 'package:movies_app/movies/domain/repository/movies_respository.dart';

class GetRecommendationMovieUseCase extends UseCase<List<Recommendation>,RecommendationPermeter>{
  final BaseMoviesRespository baseMoviesRespository;
  GetRecommendationMovieUseCase(this.baseMoviesRespository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationPermeter parmeters)async {
   return await baseMoviesRespository.getRecommendationMovie(parmeters);

  }

}
class RecommendationPermeter extends Equatable{
  final int id;

 const  RecommendationPermeter(this.id);

  @override

  List<Object?> get props => [id];

}