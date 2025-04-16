import 'package:dartz/dartz.dart';
import 'package:movie_clean_arch_test/core/error/failure.dart';
import 'package:movie_clean_arch_test/features/movie/domain/entities/movie_entity.dart';

abstract class BaseMovieRepositories {
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies();
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
}
