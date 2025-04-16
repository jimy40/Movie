import 'package:dartz/dartz.dart';
import 'package:movie_clean_arch_test/core/error/failure.dart';
import 'package:movie_clean_arch_test/features/movie_details/domain/entities/movie_details_enityt.dart';
import 'package:movie_clean_arch_test/features/movie_details/domain/repositories/movie_details_repository.dart';

class GetMovieDetailsUsecase {
  final BaseMovieDetailsRepository baseMovieDetailsRepository;
  GetMovieDetailsUsecase({required this.baseMovieDetailsRepository});

  Future<Either<Failure, MovieDetailsEntity>> call(int movieId) async {
    return await baseMovieDetailsRepository.getMovieDetails(movieId);
  }
}
