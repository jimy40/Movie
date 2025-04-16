import 'package:dartz/dartz.dart';
import 'package:movie_clean_arch_test/core/error/failure.dart';

// Parameters have to be put into a container object so that they can be
// included in this abstract base class method definition.
abstract class BaseUsecase<t> {
  Future<Either<Failure, t>> call();
}
