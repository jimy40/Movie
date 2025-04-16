import 'package:dartz/dartz.dart';
import 'package:movie_clean_arch_test/core/error/failure.dart';
import 'package:movie_clean_arch_test/features/watch_list/domain/entities/watch_list_movie_entity.dart';

abstract class WatchListBaseRepository {
  Future<Either<Failure, List<WatchListMovieEntity>>> getWatchList();
  Future<Either<Failure, Unit>> addWatchList({required int id});
}
