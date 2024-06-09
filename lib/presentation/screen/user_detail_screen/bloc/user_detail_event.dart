part of 'user_detail_bloc.dart';

@immutable
sealed class UserDetailEvent {}

final class UserDetailInitEvent extends UserDetailEvent {
  final String id;

  UserDetailInitEvent({required this.id});
}

final class UserDetailDeleteEvent extends UserDetailEvent {
  final String id;

  UserDetailDeleteEvent({required this.id});
}

final class UserDetailUpdateEvent extends UserDetailEvent {
  final UserEntity userEntity;

  UserDetailUpdateEvent({required this.userEntity});
}
