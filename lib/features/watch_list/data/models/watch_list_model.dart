import 'package:movie_clean_arch_test/features/watch_list/domain/entities/watch_list_movie_entity.dart';

class WatchListModel extends WatchListMovieEntity {
  const WatchListModel(
      {required super.image,
      required super.voteAverage,
      required super.title,
      required super.releaseDate,
      required super.id});

  factory WatchListModel.fromJson(Map<String, dynamic> json) {
    return WatchListModel(
      image: json['poster_path'],
      voteAverage: json['vote_average'],
      title: json['title'],
      releaseDate: json['release_date'],
      id: json['id'],
    );
  }
}
