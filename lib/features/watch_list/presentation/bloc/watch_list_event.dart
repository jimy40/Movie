part of 'watch_list_bloc.dart';

abstract class WatchListEvent extends Equatable {
  const WatchListEvent();

  @override
  List<Object> get props => [];
}

class GetWatchListEvent extends WatchListEvent {}

class AddWatchListEvent extends WatchListEvent {
  final int id;
  const AddWatchListEvent({required this.id});
}
