import 'package:movie_clean_arch_test/core/error/exceptions.dart';
import 'package:movie_clean_arch_test/core/error/failure.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/assets_manager.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/string_manager.dart.dart';

extension ExceptionHandler on Exception {
  Failure toFailure() {
    if (this is InternetConnectionException) {
      return const Failure(
        image: AssetsManager.internetConnectionError,
        message: StringManager.internetConnectionError,
      );
    }
    if (this is ApiNetworkException) {
      return const Failure(
        image: AssetsManager.internetConnectionError,
        message: StringManager.internetConnectionError,
      );
    }

    if (this is ApiTimeoutException) {
      return const Failure(
        image: AssetsManager.defaultError,
        message: StringManager.timeoutError,
      );
    }

    if (this is ServerException) {
      return const Failure(
        image: AssetsManager.defaultError,
        message: StringManager.serverError,
      );
    }

    if (this is ExceptionWithMessage) {
      return Failure(
        image: AssetsManager.defaultError,
        message: (this as ExceptionWithMessage).message,
      );
    }

    return const Failure(
      image: AssetsManager.defaultError,
      message: StringManager.somethingWentWrong,
    );
  }
}
