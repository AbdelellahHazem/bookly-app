import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with the server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with the server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with the server');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request to the server was cancelled');

      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');

      case DioExceptionType.unknown:
        return ServerFailure('Unexpected error, please try again');

      default:
        return ServerFailure('Something went wrong, please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Request not found, please try again');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, please try again later');
    } else {
      return ServerFailure('Something went wrong, please try another time');
    }
  }
}
