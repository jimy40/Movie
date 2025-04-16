import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String image;
  final String message;

  const Failure({required this.image, required this.message});

  @override
  List<Object?> get props => [image, message];
}

class VerifyAccountFailure extends Failure {
  const VerifyAccountFailure() : super(image: '', message: '');
}

// class LocationPermissionFailure extends Failure {
//   LocationPermissionFailure()
//     : super(
//         image: AssetsManager.giftyLogo,
//         message: AppStrings.locationPermissionError,
//       );
// }
