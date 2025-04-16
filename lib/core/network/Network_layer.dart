import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_clean_arch_test/core/error/exceptions.dart';

class ApiService {
  final Duration _timeOut = const Duration(minutes: 1);

  Future<Either<Exception, Map<String, dynamic>>> getWithBody({
    required Uri uri,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    try {
      var request = http.Request('GET', uri);
      request.headers.addAll(headers);
      request.body = json.encode(body);
      http.StreamedResponse streamResponse =
          await request.send().timeout(_timeOut);
      final response = await http.Response.fromStream(streamResponse);
      debugPrint('''

========================================================
url ==> $uri
headers ==> $headers
body ==> $body
response ==> ${response.body.toString()}
========================================================

''');
      if (streamResponse.statusCode > 199 && streamResponse.statusCode < 300) {
        return Right(json.decode(response.body));
      } else {
        String message = jsonDecode(response.body)['message'];
        return Left(ApiExceptionWithMessage(message));
      }
    } on SocketException catch (_) {
      return Left(ApiNetworkException());
    } on TimeoutException catch (_) {
      return Left(ApiTimeoutException());
    } catch (e) {
      debugPrint('''

========================================================
url ==> $uri
headers ==> $headers
body ==> $body
response ==> $e
========================================================

''');
      return Left(ApiDefaultException());
    }
  }

  Future<Either<Exception, Map<String, dynamic>>> putMultiPart({
    required Uri uri,
    required List<http.MultipartFile> allFiles,
    Map<String, String>? body,
    Map<String, String>? headers,
  }) async {
    try {
      http.MultipartRequest request = http.MultipartRequest('PUT', uri);

      for (var element in allFiles) {
        request.files.add(element);
      }

      if (headers != null) {
        request.headers.addAll(headers);
      }
      if (body != null) {
        request.fields.addAll(body);
      }
      http.StreamedResponse streamResponse =
          await request.send().timeout(_timeOut);
      final response = await http.Response.fromStream(streamResponse);

      debugPrint('''

========================================================
url ==> $uri
headers ==> $headers
body ==> $body
response ==> ${response.body.toString()}
========================================================

''');
      if (streamResponse.statusCode > 199 && streamResponse.statusCode < 300) {
        return Right(json.decode(response.body));
      } else {
        String message = jsonDecode(response.body)['message'];
        return Left(ApiExceptionWithMessage(message));
      }
    } on SocketException catch (_) {
      return Left(ApiNetworkException());
    } on TimeoutException catch (_) {
      return Left(ApiTimeoutException());
    } catch (e) {
      return Left(ApiDefaultException());
    }
  }

  Future<Either<Exception, Map<String, dynamic>>> postMultiPart({
    required Uri uri,
    required String filePath,
    required String fieldName,
    Map<String, String>? body,
  }) async {
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath(fieldName, filePath);
      request.files.add(multipartFile);
      if (body != null) {
        request.fields.addAll(body);
      }
      http.StreamedResponse streamResponse =
          await request.send().timeout(_timeOut);
      final response = await http.Response.fromStream(streamResponse);

      debugPrint('''

========================================================
url ==> $uri
body ==> $body
response ==> ${response.body.toString()}
========================================================

''');
      if (streamResponse.statusCode > 199 && streamResponse.statusCode < 300) {
        return Right(json.decode(response.body));
      } else {
        String message = jsonDecode(response.body)['message'];
        return Left(ApiExceptionWithMessage(message));
      }
    } on SocketException catch (_) {
      return Left(ApiNetworkException());
    } on TimeoutException catch (_) {
      return Left(ApiTimeoutException());
    } catch (e) {
      return Left(ApiDefaultException());
    }
  }

  Future<Either<Exception, dynamic>> getData(
      {required Uri uri, required Map<String, String> headers}) async {
    final result = await _runApiRequest(
      () => http.get(uri, headers: headers).timeout(_timeOut),
    );
    debugPrint('''

========================================================
url ==> $uri
headers ==> $headers
response ==> ${result.toString()}
========================================================

''');
    return result.fold(
      (l) {
        return Left(l);
      },
      (r) {
        debugPrint(r.body.toString());
        return Right(jsonDecode(r.body));
      },
    );
  }

  Future<Either<Exception, dynamic>> postData({
    required Uri uri,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final result = await _runApiRequest(
      () => http
          .post(uri, headers: headers, body: json.encode(body))
          .timeout(_timeOut),
    );

    debugPrint('''

========================================================
url ==> $uri
headers ==> $headers
body ==> $body
response ==> ${result.toString()}
========================================================

''');

    return result.fold(
      (l) => Left(l),
      (r) {
        debugPrint(r.body.toString());
        return Right(json.decode(r.body));
      },
    );
  }

  Future<Either<Exception, Map<String, dynamic>>> putData(
      {required Uri uri,
      required Map<String, String> headers,
      required Map<String, dynamic> body}) async {
    final result = await _runApiRequest(
      () => http
          .put(uri, headers: headers, body: json.encode(body))
          .timeout(_timeOut),
    );
    debugPrint('''

========================================================
url ==> $uri
headers ==> $headers
body ==> $body
response ==> ${result.toString()}
========================================================

''');
    return result.fold(
      (l) => Left(l),
      (r) {
        debugPrint(r.body.toString());

        return Right(json.decode(r.body));
      },
    );
  }

  Future<Either<Exception, Map<String, dynamic>>> patchData(
      {required Uri uri,
      required Map<String, String> headers,
      required Map<String, dynamic> body}) async {
    final result = await _runApiRequest(
      () => http
          .patch(uri, headers: headers, body: json.encode(body))
          .timeout(_timeOut),
    );
    debugPrint('''

========================================================
url ==> $uri
headers ==> $headers
body ==> $body
response ==> ${result.toString()}
========================================================

''');
    return result.fold(
      (l) => Left(l),
      (r) {
        debugPrint(r.body.toString());

        return Right(json.decode(r.body));
      },
    );
  }

  Future<Either<Exception, Map<String, dynamic>>> patchDataWithoutBody({
    required Uri uri,
    required Map<String, String> headers,
    dynamic body,
  }) async {
    final result = await _runApiRequest(
      () => http
          .patch(uri, headers: headers, body: json.encode(body))
          .timeout(_timeOut),
    );
    debugPrint('''

========================================================
url ==> $uri
headers ==> $headers
body ==> $body
response ==> ${result.toString()}
========================================================

''');
    return result.fold(
      (l) => Left(l),
      (r) {
        debugPrint(r.body.toString());

        return Right(json.decode(r.body));
      },
    );
  }

  Future<Either<Exception, Unit>> deleteData(
      {required Uri uri,
      required Map<String, String> headers,
      Map<String, dynamic>? body}) async {
    final result = await _runApiRequest(
      () => http
          .delete(uri, headers: headers, body: json.encode(body))
          .timeout(_timeOut),
    );

    debugPrint('''

========================================================
url ==> $uri
headers ==> $headers
body ==> $body
response ==> ${result.toString()}
========================================================

''');
    return result.fold(
      (l) => Left(l),
      (r) {
        return const Right(unit);
      },
    );
  }

  Future<Either<Exception, http.Response>> _runApiRequest(
      Future<http.Response> Function() function) async {
    try {
      final http.Response response = await function();

      if (response.statusCode > 199 && response.statusCode < 300) {
        if (response.statusCode == 202) {
          return Left(ApiNoPermission());
        }
        return Right(response);
      } else {
        String? message = jsonDecode(response.body)['message'];

        return Left(_statusCodeToException(response.statusCode, message));
      }
    } on SocketException catch (_) {
      return Left(ApiNetworkException());
    } on TimeoutException catch (_) {
      return Left(ApiTimeoutException());
    } catch (e) {
      debugPrint(e.toString());
      return Left(ApiDefaultException());
    }
  }

  Exception _statusCodeToException(int statusCode, String? message) {
    if (statusCode == 401) {
      return ApiAuthrizationExcption();
    } else if (message == null) {
      if (statusCode >= 500) {
        return ApiInternalServerExcption();
      } else if (statusCode < 500 && statusCode > 399) {
        return ApiDefaultException();
      }
      return ApiDefaultException();
    } else {
      return ApiExceptionWithMessage(message);
    }
  }
}
