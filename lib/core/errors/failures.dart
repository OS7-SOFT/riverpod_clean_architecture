import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get getMessage;
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure({required this.message});

  @override
  String get getMessage => message;
  @override
  List<Object?> get props => [message, getMessage];
}

class EmptyCacheFailure extends Failure {
  final String message;

  EmptyCacheFailure({required this.message});

  @override
  String get getMessage => message;
  @override
  List<Object?> get props => [message, getMessage];
}

class NetworkFailure extends Failure {
  final String message;
  NetworkFailure({required this.message});

  @override
  String get getMessage => message;

  @override
  List<Object?> get props => [message, getMessage];
}
