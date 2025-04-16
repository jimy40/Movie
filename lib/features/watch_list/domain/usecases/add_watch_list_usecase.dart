import 'package:dartz/dartz.dart';
import 'package:movie_clean_arch_test/core/error/failure.dart';
import 'package:movie_clean_arch_test/features/watch_list/domain/repositories/watch_list_base_repository.dart';

class AddWatchListUsecase {
  final WatchListBaseRepository movieDetailsRepository;
  AddWatchListUsecase({required this.movieDetailsRepository});

  Future<Either<Failure, Unit>> call({required int id}) => movieDetailsRepository.addWatchList(id: id);
}
