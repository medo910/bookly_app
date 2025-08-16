// import 'package:dio/dio.dart';

// abstract class Failure {
//   final String errmessage;

//   const Failure(this.errmessage);
// }

// class ServerFailure extends Failure {
//   ServerFailure(super.errmessage);
//   factory ServerFailure.fromDioException(DioException e) {
//     switch (e.type) {
//       case DioExceptionType.connectionTimeout:
//         return ServerFailure('Connection Timeout with the ApiServer');
//       case DioExceptionType.sendTimeout:
//         return ServerFailure('Send Timeout with the ApiServer');
//       case DioExceptionType.receiveTimeout:
//         return ServerFailure('Receive Timeout with the ApiServer');
//       case DioExceptionType.badResponse:
//         return ServerFailure.fromresponse(
//           e.response!.statusCode,
//           e.response!.data,
//         );
//       case DioExceptionType.cancel:
//         return ServerFailure('Request to the ApiServer was Cancelled');
//       case DioExceptionType.unknown:
//         if (DioException.massage.contains("SocketException")) {
//           return ServerFailure("No Internet Connection");
//         }
//         return ServerFailure('An unknown error occurred');
//       default:
//         return ServerFailure('An unexpected error occurred try again later');
//     }
//   }

//   factory ServerFailure.fromresponse(int statusCode, dynamic response) {
//     if (statusCode == 400 || statusCode == 403 || statusCode == 401) {
//       return ServerFailure(response['error']['message']);
//     } else if (statusCode == 404) {
//       return ServerFailure('Resource not found');
//     } else if (statusCode == 500) {
//       return ServerFailure('Internal Server Error');
//     } else {
//       return ServerFailure('Unexpected Error: $statusCode');
//     }
//   }
// }

import 'package:dio/dio.dart';

abstract class Failure {
  final String errmessage;
  const Failure(this.errmessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errmessage);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with the ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with the ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with the ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromresponse(
          e.response?.statusCode,
          e.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to the ApiServer was Cancelled');
      case DioExceptionType.unknown:
        if (e.message != null && e.message!.contains("SocketException")) {
          return ServerFailure("No Internet Connection");
        }
        return ServerFailure('An unknown error occurred');
      default:
        return ServerFailure('An unexpected error occurred try again later');
    }
  }

  factory ServerFailure.fromresponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 403 || statusCode == 401) {
      final message = response?['error']?['message'] ?? 'Authentication Error';
      return ServerFailure(message);
    } else if (statusCode == 404) {
      return ServerFailure('Resource not found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error');
    } else {
      return ServerFailure('Unexpected Error: $statusCode');
    }
  }
}
