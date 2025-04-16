part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailsEntity? movieDetailsData;
  final RequestState movieDetailsrequestState;
  final String movieDetailsMessage;

  const MovieDetailsState({
    this.movieDetailsData,
    this.movieDetailsrequestState = RequestState.loading,
    this.movieDetailsMessage = '',
  });

  @override
  List<Object?> get props => [
        movieDetailsrequestState,
        movieDetailsMessage,
        movieDetailsData,
      ];

  MovieDetailsState copyWith({
    MovieDetailsEntity? movieDetailsData,
    RequestState? movieDetailsrequestState,
    String? movieDetailsMessage,
  }) {
    return MovieDetailsState(
      movieDetailsData: movieDetailsData ?? this.movieDetailsData,
      movieDetailsrequestState:
          movieDetailsrequestState ?? this.movieDetailsrequestState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
    );
  }
}
