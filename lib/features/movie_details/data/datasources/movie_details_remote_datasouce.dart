import 'package:dartz/dartz.dart';
import 'package:movie_clean_arch_test/core/network/Network_layer.dart';
import 'package:movie_clean_arch_test/core/network/network_constants.dart';
import 'package:movie_clean_arch_test/core/network/netwrok_helper.dart';
import 'package:movie_clean_arch_test/features/movie_details/data/models/movie_details_model.dart';

abstract class BaseMovieDetailsRemoteDataSource {
  Future<Either<Exception, MovieDetailsModel>> getMovieDetails(int movieId);
}

class MovieDetailsRemoteDataSource extends BaseMovieDetailsRemoteDataSource {
  
  @override
  Future<Either<Exception, MovieDetailsModel>> getMovieDetails(
      int movieId) async {



    final result = await ApiService().getData(
        uri: Uri.parse(NetworkConstants.baseUrl + movieId.toString()),
        headers: await NetworkHelper().getHeadersWithToken());
    return result.map((data) => MovieDetailsModel.fromJson(data));
  }

  
}
