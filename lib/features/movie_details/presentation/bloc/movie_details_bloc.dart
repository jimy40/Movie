import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/enums.dart';
import 'package:movie_clean_arch_test/features/movie_details/domain/entities/movie_details_enityt.dart';
import 'package:movie_clean_arch_test/features/movie_details/domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase movieDetailsRepositoriy;
  MovieDetailsBloc(
    this.movieDetailsRepositoriy,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      emit(state.copyWith(
        movieDetailsrequestState: RequestState.loading,
      ));
      final result = await movieDetailsRepositoriy.call(event.movieId);

      return result.fold((l) {
        emit(state.copyWith(
            movieDetailsrequestState: RequestState.error,
            movieDetailsMessage: l.message));
      }, (s) {
        emit(state.copyWith(
            movieDetailsrequestState: RequestState.loaded,
            movieDetailsData: s));
      });
    });
  }
}
