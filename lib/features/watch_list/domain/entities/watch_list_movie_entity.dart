import 'package:equatable/equatable.dart';

class WatchListMovieEntity extends Equatable {
  final String image;
  final double voteAverage;
  final String title;
  final String releaseDate;
  final int id;

  const WatchListMovieEntity(
      {required this.image,
      required this.voteAverage,
      required this.title,
      required this.releaseDate,
      required this.id});

  @override
  List<Object?> get props => [image, voteAverage, title, releaseDate, id];
}
