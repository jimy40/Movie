import 'package:get_it/get_it.dart';
import 'package:movie_clean_arch_test/features/movie/data/datasources/movies_remote_data_source.dart';
import 'package:movie_clean_arch_test/features/movie/data/repositories/movie_repositoriy_impl.dart';
import 'package:movie_clean_arch_test/features/movie/domain/repositories/base_movie_repositories.dart';
import 'package:movie_clean_arch_test/features/movie/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_clean_arch_test/features/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_clean_arch_test/features/movie/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_clean_arch_test/features/movie/domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:movie_clean_arch_test/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie_clean_arch_test/features/movie_details/data/datasources/movie_details_remote_datasouce.dart';
import 'package:movie_clean_arch_test/features/movie_details/data/repositories/movie_details_repositoriy.dart';
import 'package:movie_clean_arch_test/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:movie_clean_arch_test/features/movie_details/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_clean_arch_test/features/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:movie_clean_arch_test/features/watch_list/data/datasources/watch_list_remote_data_source/watch_list_remote_data_source.dart';
import 'package:movie_clean_arch_test/features/watch_list/data/repositories/watch_list_repo_impl.dart';
import 'package:movie_clean_arch_test/features/watch_list/domain/repositories/watch_list_base_repository.dart';
import 'package:movie_clean_arch_test/features/watch_list/domain/usecases/add_watch_list_usecase.dart';
import 'package:movie_clean_arch_test/features/watch_list/domain/usecases/get_watch_list_usecase.dart';
import 'package:movie_clean_arch_test/features/watch_list/presentation/bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> getItSetup() async {
  injectDataSources();
  injectRepositories();
  injectUseCases();
  injectBlocs();
}

injectDataSources() {
  sl.registerLazySingleton<BaseMovieDetailsRemoteDataSource>(
      () => MovieDetailsRemoteDataSource());

  sl.registerLazySingleton<WatchListBaseRemoteDataSource>(
      () => WatchListRemoteDataSourceImpl());
  sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
      () => MoviesRemoteDataSource());
}

injectRepositories() {
  sl.registerLazySingleton<BaseMovieRepositories>(
      () => MovieRepositoriyImpl(baseMoviesRemoteDataSource: sl()));
  sl.registerLazySingleton<WatchListBaseRepository>(
      () => WatchListRepoImpl(watchListBaseRemoteDataSource: sl()));
  sl.registerLazySingleton<BaseMovieDetailsRepository>(
      () => MovieDetailsRepositoriy(sl()));
}

injectUseCases() {
  sl.registerLazySingleton(
      () => GetNowPlayingMoviesUsecase(baseMovieRepositories: sl()));
  sl.registerLazySingleton(
      () => GetPopularMoviesUsecase(baseMovieRepositories: sl()));
  sl.registerLazySingleton(
      () => GetTopRatedMoviesUsecase(baseMovieRepositories: sl()));

  sl.registerLazySingleton(
      () => GetUpcomingMoviesUsecase(baseMovieRepositories: sl()));
  sl.registerLazySingleton(
      () => GetWatchListUsecase(movieDetailsRepository: sl()));
  sl.registerLazySingleton(
      () => AddWatchListUsecase(movieDetailsRepository: sl()));

  sl.registerLazySingleton(
      () => GetMovieDetailsUsecase(baseMovieDetailsRepository: sl()));
}

injectBlocs() {
  sl.registerFactory(() => MovieBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => WatchListBloc(sl(), sl()));
  sl.registerFactory(() => MovieDetailsBloc(
        sl(),
      ));
}
