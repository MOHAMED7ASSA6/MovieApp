import '../../domain/entities/Recommendation_movie.dart';

class RecommendationModel extends Recommendation{
  RecommendationModel({ super.backdropPath, required super.id});

  factory RecommendationModel.fromjson(Map<String, dynamic >json)=>RecommendationModel(
    id: json["id"],
    backdropPath:json["backdrop_path"] ??'/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg',);

}