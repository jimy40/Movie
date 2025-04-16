part of 'watch_list_bloc.dart';

class WatchListState extends Equatable {
  final List<WatchListMovieEntity> watchList;
  final String watchListMessage;
  final RequestState watchListRequestState;

  final String addWatchListMessage;
  final RequestState addWatchListRequestState;

  const WatchListState(
      {this.watchList = const [],
      this.watchListMessage = '',
      this.watchListRequestState = RequestState.loading,
      this.addWatchListMessage = '',
      this.addWatchListRequestState = RequestState.loading});

  @override
  List<Object> get props => [
        watchList,
        watchListMessage,
        watchListRequestState,
        addWatchListMessage,
        addWatchListRequestState
      ];

  WatchListState copyWith({
    List<WatchListMovieEntity>? watchList,
    String? watchListMessage,
    RequestState? watchListRequestState,
    String? addWatchListMessage,
    RequestState? addWatchListRequestState,
  }) {
    return WatchListState(
      watchList: watchList ?? this.watchList,
      watchListMessage: watchListMessage ?? this.watchListMessage,
      watchListRequestState:
          watchListRequestState ?? this.watchListRequestState,
      addWatchListMessage: addWatchListMessage ?? this.addWatchListMessage,
      addWatchListRequestState:
          addWatchListRequestState ?? this.addWatchListRequestState,
    );
  }
}
