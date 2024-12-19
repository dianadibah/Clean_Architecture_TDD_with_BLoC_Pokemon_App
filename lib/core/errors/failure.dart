// import 'package:dio/dio.dart';

// class Failure {
//   final String messageError;

//   Failure({required this.messageError});
// }

// class ServerFailure extends Failure {
//   ServerFailure({required super.messageError});
//   factory ServerFailure.fromError(DioException dioException) {
//     switch (dioException.type) {
//       case DioExceptionType.sendTimeout:
//         return ServerFailure(messageError: "OoPs,sendTimeout");
//       case DioExceptionType.connectionTimeout:
//         return ServerFailure(messageError: "connectionTimeout");
//       case DioExceptionType.receiveTimeout:
//         return ServerFailure(messageError: "receiveTimeout");
//       case DioExceptionType.badCertificate:
//         return ServerFailure(messageError: "badCertificate");
//       case DioExceptionType.badResponse:
//       case DioExceptionType.cancel:
//         return ServerFailure(messageError: "cancel");
//       case DioExceptionType.connectionError:
//         return ServerFailure(messageError: "connectionError");
//       case DioExceptionType.unknown:
//         return ServerFailure(messageError: "unknown");
//     }
//   }
//   factory ServerFailure.fromResponse(int statuseCode, dynamic response) {
//     if (statuseCode == 403 || statuseCode == 400 || statuseCode == 401) {
//       return ServerFailure(messageError: response[0]["errors"]["message"]);
//     } else if (statuseCode == 404) {
//       return ServerFailure(
//           messageError: "Your Request is not found,Please Try Again...");
//     } else if (statuseCode == 500) {
//       return ServerFailure(
//           messageError: "There is problem with server,Please Try Again...");
//     } else {
//       return ServerFailure(
//           messageError: "Oops,There was an wrong,Please try agai.. ");
//     }
//   }
// }
