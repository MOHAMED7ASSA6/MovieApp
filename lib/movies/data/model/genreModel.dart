import '../../domain/entities/Genreids.dart';
import 'movie_details_model.dart';

class GenreModel extends Genreids{
  GenreModel({required super.name, required super.id});
  factory GenreModel.fromjson(Map<String,dynamic>json)=>GenreModel(
  name:json["name"],
  id:json["id"],
  );
}