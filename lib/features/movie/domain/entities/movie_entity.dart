import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final bool adult;
  final String backdropPath;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final String poster;
  final String title;

  const MovieEntity(
      {required this.adult,
      required this.backdropPath,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage,
      required this.poster,
      required this.title,
      required this.voteCount});

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        voteAverage,
        voteCount,
        poster,
        title
      ];
}
