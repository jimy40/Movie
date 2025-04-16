import 'package:movie_clean_arch_test/features/movie_details/domain/entities/recommendation_movies_entity.dart';

class RecommendedMovieModel extends RecommendationMoviesEntity {
  const RecommendedMovieModel(
      {required super.id, required super.title, required super.imageUrl});

  factory RecommendedMovieModel.fromJson(Map<String, dynamic> json) {
    return RecommendedMovieModel(
        id: json['id'].toString(),
        title: json['title'],
        imageUrl: json['poster_path']);
  }
}
