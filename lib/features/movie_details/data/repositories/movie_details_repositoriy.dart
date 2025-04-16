import 'package:dartz/dartz.dart';
import 'package:movie_clean_arch_test/core/core.dart';
import 'package:movie_clean_arch_test/core/error/failure.dart';

import 'package:movie_clean_arch_test/features/movie_details/data/datasources/movie_details_remote_datasouce.dart';
import 'package:movie_clean_arch_test/features/movie_details/domain/entities/movie_details_enityt.dart';
import 'package:movie_clean_arch_test/features/movie_details/domain/repositories/movie_details_repository.dart';

class MovieDetailsRepositoriy extends BaseMovieDetailsRepository {
  final BaseMovieDetailsRemoteDataSource movieDetailsRemoteDataSource;
  MovieDetailsRepositoriy(this.movieDetailsRemoteDataSource);

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      int movieId) async {
    final result = await movieDetailsRemoteDataSource.getMovieDetails(movieId);
    return result.fold((l) => Left(l.toFailure()), (r) {
      return Right(r);
    });
  }
}
