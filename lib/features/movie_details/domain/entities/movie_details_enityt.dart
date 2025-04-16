import 'package:equatable/equatable.dart';

class MovieDetailsEntity extends Equatable {
  final bool isAdult;
  final String imageUrl;
  final int id;
  final String language;
  final String title;
  final String releasedDate;
  final double voteAverage;
  final int voteCount;
  final int runTime;
  final String year;
  final String type;
  final String poster;

  const MovieDetailsEntity(
      {required this.isAdult,
      required this.imageUrl,
      required this.id,
      required this.language,
      required this.title,
      required this.releasedDate,
      required this.voteAverage,
      required this.voteCount,
      required this.runTime,
      required this.year,
      required this.type,
      required this.poster});

  @override
  List<Object?> get props => [
        isAdult,
        imageUrl,
        id,
        language,
        title,
        releasedDate,
        voteAverage,
        voteCount,
        runTime,
        releasedDate,
        type,
        poster
      ];
}
