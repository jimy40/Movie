import 'package:dartz/dartz.dart';
import 'package:movie_clean_arch_test/core/error/failure.dart';
import 'package:movie_clean_arch_test/features/watch_list/domain/entities/watch_list_movie_entity.dart';
import 'package:movie_clean_arch_test/features/watch_list/domain/repositories/watch_list_base_repository.dart';

class GetWatchListUsecase {
  final WatchListBaseRepository movieDetailsRepository;
  GetWatchListUsecase({required this.movieDetailsRepository});

  Future<Either<Failure, List<WatchListMovieEntity>>> call() =>
      movieDetailsRepository.getWatchList();
}
