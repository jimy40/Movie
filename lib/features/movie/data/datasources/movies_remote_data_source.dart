import 'package:dartz/dartz.dart';
import 'package:movie_clean_arch_test/core/network/Network_layer.dart';
import 'package:movie_clean_arch_test/core/network/network_constants.dart';
import 'package:movie_clean_arch_test/core/network/netwrok_helper.dart';
import 'package:movie_clean_arch_test/features/movie/data/models/movies_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<Either<Exception, List<MoviesModel>>> getPopularMovies();
  Future<Either<Exception, List<MoviesModel>>> getTopRatedMovies();
  Future<Either<Exception, List<MoviesModel>>> getNowPlayingMovies();
  Future<Either<Exception, List<MoviesModel>>> getUpcomingMovies();
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  final ApiService _apiService = ApiService();
  final NetworkHelper _networkHelper = NetworkHelper();

  @override
  Future<Either<Exception, List<MoviesModel>>> getPopularMovies() {
    return _fetchMovies(NetworkConstants.getPopular);
  }

  @override
  Future<Either<Exception, List<MoviesModel>>> getTopRatedMovies() {
    return _fetchMovies(NetworkConstants.getTopRated);
  }

  @override
  Future<Either<Exception, List<MoviesModel>>> getNowPlayingMovies() {
    return _fetchMovies(NetworkConstants.getNowPlaying);
  }

  @override
  Future<Either<Exception, List<MoviesModel>>> getUpcomingMovies() {
    return _fetchMovies(NetworkConstants.getUpcoming);
  }

  Future<Either<Exception, List<MoviesModel>>> _fetchMovies(
      String endpoint) async {
    final uri = Uri.parse('${NetworkConstants.baseUrl}$endpoint');
    final headers = await _networkHelper.getHeadersWithToken();

    final result = await _apiService.getData(uri: uri, headers: headers);

    return result.map(
      (r) => (r['results'] as List)
          .map<MoviesModel>((e) => MoviesModel.fromJson(e))
          .toList(),
    );
  }
}
