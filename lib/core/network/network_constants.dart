class NetworkConstants {
  static const String imageUrl = 'https://image.tmdb.org/t/p/w500/';
  static const String baseUrl = 'https://api.themoviedb.org/3/movie/';
  static const String apiKey = '47481d70c5928f4fb6d45e592a12bc43';
  static const String getNowPlaying = 'now_playing';
  static const String getTopRated = 'top_rated';
  static const String getPopular = 'popular';
  static const String getUpcoming = 'upcoming';

  static const String getWatchList =
      'https://api.themoviedb.org/3/account/21871340/watchlist/movies?language=en-US&page=1&sort_by=created_at.asc';
  static const String addWatchList =
      'https://api.themoviedb.org/3/account/21871340/watchlist';
}
