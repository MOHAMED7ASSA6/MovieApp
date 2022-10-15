import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../failure/filure.dart';

abstract class UseCase<T,Parmeters>{
  Future<Either<Failure,T>> call(Parmeters parmeters);
}

class noParmeter extends Equatable{
   const noParmeter();

  @override

  List<Object?> get props => [];
}