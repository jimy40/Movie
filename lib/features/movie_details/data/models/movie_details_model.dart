import 'package:movie_clean_arch_test/features/movie_details/domain/entities/movie_details_enityt.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel(
      {required super.isAdult,
      required super.imageUrl,
      required super.id,
      required super.language,
      required super.title,
      required super.releasedDate,
      required super.voteAverage,
      required super.voteCount,
      required super.runTime,
      required super.year,
      required super.type,
      required super.poster});
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        isAdult: json['adult'],
        imageUrl: json['backdrop_path'] ?? '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg',
        id: json['id'],
        language: json['original_language'],
        title: json['title'],
        releasedDate: json['release_date'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
        runTime: json['runtime'],
        year: json['release_date'],
        type: json['genres'][0]['name'],
        poster: json['poster_path']);
  }
}
