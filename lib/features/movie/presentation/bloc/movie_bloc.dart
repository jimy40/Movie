import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/enums.dart';
import 'package:movie_clean_arch_test/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_clean_arch_test/features/movie/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_clean_arch_test/features/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_clean_arch_test/features/movie/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_clean_arch_test/features/movie/domain/usecases/get_upcoming_movies_usecase.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  final GetUpcomingMoviesUsecase getUpcomingMoviesUsecase;
  MovieBloc(this.getNowPlayingMoviesUsecase, this.getPopularMoviesUsecase,
      this.getTopRatedMoviesUsecase, this.getUpcomingMoviesUsecase)
      : super(const MovieState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
    on<GetUpcomingMoviesEvent>(_getUpcommingMovies);
  }
  FutureOr<void> _getUpcommingMovies(
      GetUpcomingMoviesEvent event, Emitter<MovieState> emit) async {
    emit(state.copyWith(
      upcomminMoviesRequestState: RequestState.loading,
    ));
    final result = await getUpcomingMoviesUsecase.call();
    result.fold((l) {
      emit(state.copyWith(
          upcomminMoviesRequestState: RequestState.error,
          upcomminMoviesMessage: l.message));
    }, (r) {
      emit(state.copyWith(
          upcomminMoviesRequestState: RequestState.loaded, upcommingMovies: r));
    });
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MovieState> emit) async {
    emit(state.copyWith(nowPlayingRequestState: RequestState.loading));
    final result = await getNowPlayingMoviesUsecase();
    result.fold((l) {
      emit(state.copyWith(
          nowPlayingRequestState: RequestState.error,
          nowPlayingMessage: l.message));
    }, (r) {
      emit(state.copyWith(
          nowPlayingRequestState: RequestState.loaded, nowPlayingMovies: r));
    });
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getPopularMoviesUsecase.call();
    result.fold((l) {
      emit(state.copyWith(
          popularMoviesRequestState: RequestState.error,
          popularMoviesMessage: l.message));
    }, (r) {
      emit(state.copyWith(
          popularMoviesRequestState: RequestState.loaded, popularMovies: r));
    });
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getTopRatedMoviesUsecase.call();
    result.fold((l) {
      emit(state.copyWith(
          topRatedMoviesRequestState: RequestState.error,
          topRatedMoviesMessage: l.message));
    }, (r) {
      emit(state.copyWith(
          topRatedMoviesRequestState: RequestState.loaded, topRatedMovies: r));
    });
  }
}
