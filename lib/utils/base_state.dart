import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitState extends BaseState {}

class ProgressState extends BaseState {}

class ErrorState extends BaseState {
  ErrorState({
    this.title,
    this.message,
  });

  final String? title;
  final String? message;

  @override
  List<Object?> get props => [title, message];
}
