import 'package:equatable/equatable.dart';

class Recommendation extends Equatable{
  final String ?backdropPath;
  final int id;

  Recommendation({
     this.backdropPath,
    required this.id
});


  @override

  List<Object?> get props => [backdropPath,id];
}