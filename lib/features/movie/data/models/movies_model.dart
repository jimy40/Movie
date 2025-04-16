import 'package:movie_clean_arch_test/features/movie/domain/entities/movie_entity.dart';

class MoviesModel extends MovieEntity {
  const MoviesModel(
      {required super.adult,
      required super.backdropPath,
      required super.id,
      required super.originalLanguage,
      required super.originalTitle,
      required super.overview,
      required super.popularity,
      required super.posterPath,
      required super.releaseDate,
      required super.voteAverage,
      required super.poster,
      required super.title,
      required super.voteCount});

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        adult: json["adult"],
        backdropPath: json["poster_path"] ?? "/tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"],
        posterPath: json["poster_path"] ?? '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg',
        releaseDate: json["release_date"],
        voteAverage: json["vote_average"],
        poster: json['backdrop_path'] ?? '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg',
        voteCount: json["vote_count"],
        title: json['original_title'],
      );
}
  //  "adult": false,
  //     "backdrop_path": "/ek8CJRZchT9YIB4p7ktEjPXuCIi.jpg",
  //     "genre_ids": [
  //       28,
  //       53,
  //       80
  //     ],
  //     "id": 1126166,
  //     "original_language": "en",
  //     "original_title": "Flight Risk",
  //     "overview": "A U.S. Marshal escorts a government witness to trial after he's accused of getting involved with a mob boss, only to discover that the pilot who is transporting them is also a hitman sent to assassinate the informant. After they subdue him, they're forced to fly together after discovering that there are others attempting to eliminate them.",
  //     "popularity": 199.997,
  //     "poster_path": "/q0bCG4NX32iIEsRFZqRtuvzNCyZ.jpg",
  //     "release_date": "2025-01-22",
  //     "title": "Flight Risk",
  //     "video": false,
  //     "vote_average": 6.1,

  // ?saasas
  //     "