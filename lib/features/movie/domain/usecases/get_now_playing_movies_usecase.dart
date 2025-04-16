import 'package:dartz/dartz.dart';
import 'package:movie_clean_arch_test/core/core.dart';
import 'package:movie_clean_arch_test/core/error/failure.dart';
import 'package:movie_clean_arch_test/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_clean_arch_test/features/movie/domain/repositories/base_movie_repositories.dart';

class GetNowPlayingMoviesUsecase extends BaseUsecase<List<MovieEntity>> {
  final BaseMovieRepositories baseMovieRepositories;
  GetNowPlayingMoviesUsecase({required this.baseMovieRepositories});

  @override
  Future<Either<Failure, List<MovieEntity>>> call() {
    return baseMovieRepositories.getNowPlayingMovies();
  }

  // Future<Either<Exception, List<MovieEntity>>>  call() =>
  //     baseMovieRepositories.getNowPlayingMovies();
}
