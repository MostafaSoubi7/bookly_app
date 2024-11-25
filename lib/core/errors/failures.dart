import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
      // TODO: Handle this case.

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.connectionError:
        if (dioError.message!.contains("SocketException")) {
          return ServerFailure("No internet Connection");
        }
        return ServerFailure("Unexpected Error, please try again!");
      default:
        return ServerFailure("Opps There was an error, please try again");

      // case DioExceptionType.unknown:
      //   // TODO: Handle this case.
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic respons) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(respons['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("your request not Found, please try again later");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server Error, please try again later");
    } else {
      return ServerFailure("Opps There was an error, please try again");
    }
  }
}

// class NetworkFailure extends Failure {}
