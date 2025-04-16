import 'package:equatable/equatable.dart';

class RecommendationMoviesEntity extends Equatable {
  final String id;
  final String title;
  final String imageUrl;

  const RecommendationMoviesEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, title, imageUrl];
}
