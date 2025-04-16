class ServerException implements Exception {
  String? message;

  ServerException(this.message);
}

class InternetConnectionException implements Exception {}

class ExceptionWithMessage implements Exception {
  final String message;

  ExceptionWithMessage({required this.message});
}

class ApiNetworkException implements Exception {}

class ApiTimeoutException implements Exception {}

class ApiAuthrizationExcption implements Exception {}

class ApiDefaultException implements Exception {}

class ApiNoPermission implements Exception {}

class ApiInternalServerExcption implements Exception {}

class ApiExceptionWithMessage implements Exception {
  final String message;

  ApiExceptionWithMessage(this.message);
}
