import 'package:dartz/dartz.dart';
import 'package:movie_clean_arch_test/core/error/failure.dart';
import 'package:movie_clean_arch_test/features/movie_details/domain/entities/movie_details_enityt.dart';

abstract class BaseMovieDetailsRepository {
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(int movieId);

}
