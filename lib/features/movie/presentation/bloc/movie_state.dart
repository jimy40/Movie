part of 'movie_bloc.dart';

class MovieState extends Equatable {
  //now playing movies states
  final List<MovieEntity> nowPlayingMovies;
  final RequestState nowPlayingRequestState;
  final String nowPlayingMessage;

  //popular movies states

  final List<MovieEntity> popularMovies;
  final RequestState popularMoviesRequestState;
  final String popularMoviesMessage;
  //toprated  movies states

  final List<MovieEntity> topRatedMovies;
  final RequestState topRatedMoviesRequestState;
  final String topRatedMoviesMessage;
//upcomming movies states
  final List<MovieEntity> upcommingMovies;
  final RequestState upcomminMoviesRequestState;
  final String upcomminMoviesMessage;
  const MovieState({
    this.nowPlayingMessage = '',
    this.nowPlayingRequestState = RequestState.loading,
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.popularMoviesRequestState = RequestState.loading,
    this.popularMoviesMessage = '',
    this.topRatedMovies = const [],
    this.topRatedMoviesRequestState = RequestState.loading,
    this.topRatedMoviesMessage = '',
    this.upcommingMovies = const [],
    this.upcomminMoviesRequestState = RequestState.loading,
    this.upcomminMoviesMessage = '',
  });

  MovieState copyWith({
    List<MovieEntity>? nowPlayingMovies,
    RequestState? nowPlayingRequestState,
    String? nowPlayingMessage,
    List<MovieEntity>? popularMovies,
    RequestState? popularMoviesRequestState,
    String? popularMoviesMessage,
    List<MovieEntity>? topRatedMovies,
    RequestState? topRatedMoviesRequestState,
    String? topRatedMoviesMessage,
    List<MovieEntity>? upcommingMovies,
    RequestState? upcomminMoviesRequestState,
    String? upcomminMoviesMessage,
  }) {
    return MovieState(
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        nowPlayingRequestState:
            nowPlayingRequestState ?? this.nowPlayingRequestState,
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        popularMovies: popularMovies ?? this.popularMovies,
        popularMoviesRequestState:
            popularMoviesRequestState ?? this.popularMoviesRequestState,
        popularMoviesMessage: popularMoviesMessage ?? this.popularMoviesMessage,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedMoviesRequestState:
            topRatedMoviesRequestState ?? this.topRatedMoviesRequestState,
        topRatedMoviesMessage:
            topRatedMoviesMessage ?? this.topRatedMoviesMessage,
        upcommingMovies: upcommingMovies ?? this.upcommingMovies,
        upcomminMoviesMessage:
            upcomminMoviesMessage ?? this.upcomminMoviesMessage,
        upcomminMoviesRequestState:
            upcomminMoviesRequestState ?? this.upcomminMoviesRequestState);
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingRequestState,
        nowPlayingMessage,
        popularMovies,
        popularMoviesRequestState,
        popularMoviesMessage,
        topRatedMovies,
        topRatedMoviesRequestState,
        topRatedMoviesMessage,
        upcomminMoviesRequestState,
        upcomminMoviesMessage
      ];
}
