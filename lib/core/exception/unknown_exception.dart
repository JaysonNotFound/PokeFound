import 'package:equatable/equatable.dart';

class UnknownException extends Equatable implements Exception {
  const UnknownException();

  @override
  List<Object> get props => [];
}
