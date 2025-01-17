import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;  const Failure({this.message});
  @override
  List<Object> get props => [];
}
// General failures
class ServerFailure extends Failure {
  const ServerFailure(String? message) : super(message: message);
}
class UnauthenticatedFailure extends Failure {
  const UnauthenticatedFailure();
}