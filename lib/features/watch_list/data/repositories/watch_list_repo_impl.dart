import 'package:dartz/dartz.dart';
import 'package:movie_clean_arch_test/core/core.dart';
import 'package:movie_clean_arch_test/core/error/failure.dart';
import 'package:movie_clean_arch_test/features/watch_list/data/datasources/watch_list_remote_data_source/watch_list_remote_data_source.dart';
import 'package:movie_clean_arch_test/features/watch_list/domain/entities/watch_list_movie_entity.dart';
import 'package:movie_clean_arch_test/features/watch_list/domain/repositories/watch_list_base_repository.dart';

class WatchListRepoImpl implements WatchListBaseRepository {
  final WatchListBaseRemoteDataSource watchListBaseRemoteDataSource;

  WatchListRepoImpl({required this.watchListBaseRemoteDataSource});
  @override
  Future<Either<Failure, Unit>> addWatchList({required int id}) async {
    final result = await watchListBaseRemoteDataSource.addWatchList(id: id , );
    return result.fold((l) => Left(l.toFailure()), (r) => const Right(unit));
  }

  @override
  Future<Either<Failure, List<WatchListMovieEntity>>> getWatchList() async {
    final result = await watchListBaseRemoteDataSource.getWatchList();
    return result.fold((l) => Left(l.toFailure()), (r) => Right(r));
  }
}
