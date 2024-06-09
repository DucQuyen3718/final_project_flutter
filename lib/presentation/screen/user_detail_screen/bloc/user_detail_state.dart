part of 'user_detail_bloc.dart';

@immutable
sealed class UserDetailState {}

final class UserDetailInitial extends UserDetailState {}

final class UserDetailLoading extends UserDetailState {}

final class UserDetailLoaded extends UserDetailState {
  final UserEntity userEntity;

  UserDetailLoaded({required this.userEntity});
}

final class UserDetailDeleted extends UserDetailState {}

final class UserDetailUpdated extends UserDetailState {}

final class UserDetailError extends UserDetailState {
  final String message;

  UserDetailError({required this.message});
}