import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/enums.dart';
import 'package:movie_clean_arch_test/features/watch_list/domain/entities/watch_list_movie_entity.dart';
import 'package:movie_clean_arch_test/features/watch_list/domain/usecases/add_watch_list_usecase.dart';
import 'package:movie_clean_arch_test/features/watch_list/domain/usecases/get_watch_list_usecase.dart';

part 'watch_list_event.dart';
part 'watch_list_state.dart';

class WatchListBloc extends Bloc<WatchListEvent, WatchListState> {
  final GetWatchListUsecase getWatchListUsecase;
  final AddWatchListUsecase addWatchListUsecase;
  WatchListBloc(this.getWatchListUsecase, this.addWatchListUsecase)
      : super(const WatchListState()) {
    on<GetWatchListEvent>((event, emit) async {
      emit(state.copyWith(watchListRequestState: RequestState.loading));
      final result = await getWatchListUsecase.call();
      result.fold((l) {
        emit(state.copyWith(
            watchListRequestState: RequestState.error,
            watchListMessage: l.message));
      }, (r) {
        emit(state.copyWith(
            watchListRequestState: RequestState.loaded, watchList: r));
      });
    });

    on<AddWatchListEvent>((event, emit) async {
      final result = await addWatchListUsecase.call(id: event.id);
      result.fold((l) {
        emit(state.copyWith(
            addWatchListRequestState: RequestState.error,
            addWatchListMessage: l.message));
      }, (r) {
        emit(state.copyWith(
          addWatchListRequestState: RequestState.loaded,
        ));
      });
    });
  }
}
