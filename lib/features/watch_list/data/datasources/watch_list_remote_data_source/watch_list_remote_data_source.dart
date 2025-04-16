import 'package:dartz/dartz.dart';
import 'package:movie_clean_arch_test/core/network/Network_layer.dart';
import 'package:movie_clean_arch_test/core/network/network_constants.dart';
import 'package:movie_clean_arch_test/core/network/netwrok_helper.dart';
import 'package:movie_clean_arch_test/features/watch_list/data/models/watch_list_model.dart';

abstract class WatchListBaseRemoteDataSource {
  Future<Either<Exception, List<WatchListModel>>> getWatchList();
  Future<Either<Exception, Unit>> addWatchList({required int id });
}

class WatchListRemoteDataSourceImpl implements WatchListBaseRemoteDataSource {
  @override
  Future<Either<Exception, List<WatchListModel>>> getWatchList() async {
    final result = await ApiService().getData(
        uri: Uri.parse(NetworkConstants.getWatchList),
        headers: await NetworkHelper().getHeadersWithToken());
    return result.map(
      (r) => r['results']
          .map<WatchListModel>((e) => WatchListModel.fromJson(e))
          .toList(),
    );
  }

  @override
  Future<Either<Exception, Unit>> addWatchList({required int id}) async {
    final result = await ApiService().postData(
        uri: Uri.parse(NetworkConstants.addWatchList),
        headers: await NetworkHelper().getHeadersWithTokenAndJsonContentType(),
        body: {"media_type": "movie", "media_id": id, "watchlist": true});
    return result.map((r) => unit);
  }
}
