import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);

  @override
  String toString() {
    return errMessage;
  }
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request is canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Check your internet conection');
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected failure, Please try again!');
      default:
        return ServerFailure('Unexpected failure, Please try again!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['eeror']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later!');
    } else {
      return ServerFailure('Something went wrong!');
    }
  }
}

class NetworkFailure extends Failure {
  NetworkFailure(super.errMessage);
}

class CacheFailure extends Failure {
  CacheFailure(super.errMessage);
}

class InvalidInputFailure extends Failure {
  InvalidInputFailure(super.errMessage);
}
