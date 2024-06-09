part of 'user_create_bloc.dart';

@immutable
sealed class UserCreateState {}

final class UserCreateInitial extends UserCreateState {}

final class UserCreateLoading extends UserCreateState {}

final class UserCreateLoaded extends UserCreateState {}

final class UserCreateSuccess extends UserCreateState {}

final class UserCreateError extends UserCreateState {
  final String message;

  UserCreateError(this.message);
}