import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/movies_respository.dart';

import '../../../core/BaseUseCase/usecase.dart';
import '../../../core/failure/filure.dart';

class GetPopularMoviesUseCase  extends UseCase<List<Movie>,noParmeter>{
  final BaseMoviesRespository baseMoviesRespository;

  GetPopularMoviesUseCase(this.baseMoviesRespository);
  @override
  Future<Either<Failure,List<Movie>>> call(noParmeter parmeter)async{
    return await baseMoviesRespository.getPopularMovies();
  }

}