import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;

const  Failure(this.message);

  @override
  List<Object> get props =>[message];


}

class ServerFilure extends Failure{
 const ServerFilure(super.message);

}

class DataBaseFilure extends Failure{
 const DataBaseFilure(super.message);

}
