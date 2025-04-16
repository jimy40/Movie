import 'package:dartz/dartz.dart';
import 'package:movie_clean_arch_test/core/core.dart';
import 'package:movie_clean_arch_test/core/error/failure.dart';
import 'package:movie_clean_arch_test/features/movie/data/datasources/movies_remote_data_source.dart';
import 'package:movie_clean_arch_test/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_clean_arch_test/features/movie/domain/repositories/base_movie_repositories.dart';

class MovieRepositoriyImpl implements BaseMovieRepositories {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;
  MovieRepositoriyImpl({required this.baseMoviesRemoteDataSource});

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async {
    final result = await baseMoviesRemoteDataSource.getNowPlayingMovies();
    return result.fold((l) => Left(l.toFailure()), (movies) => Right((movies)));
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    final result = await baseMoviesRemoteDataSource.getPopularMovies();
    return result.fold((l) => Left(l.toFailure()), (movies) => Right((movies)));
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    final result = await baseMoviesRemoteDataSource.getTopRatedMovies();
    return result.fold((l) => Left(l.toFailure()), (movies) => Right((movies)));
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies() async {
    final result = await baseMoviesRemoteDataSource.getUpcomingMovies();
    return result.fold((l) => Left(l.toFailure()), (movies) => Right((movies)));
  }
}
