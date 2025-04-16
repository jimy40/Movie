import 'package:movie_clean_arch_test/core/utilits/constants/enums.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/string_manager.dart.dart';

class ConstantsManager {
  static String getMovieCategoryLabel(MovieCategory category) {
    switch (category) {
      case MovieCategory.nowPlaying:
        return StringManager.nowPlaying;
      case MovieCategory.upcoming:
        return StringManager.upcoming;
      case MovieCategory.topRated:
        return StringManager.topRated;
      case MovieCategory.popular:
        return StringManager.popular;
    }
  }

  static String getMovieData(MovieDetailsData category) {
    switch (category) {
      case MovieDetailsData.aboutMovie:
        return StringManager.aboutMovie;
      case MovieDetailsData.reviews:
        return StringManager.review;
      case MovieDetailsData.cast:
        return StringManager.cast;
    }
  }
}
