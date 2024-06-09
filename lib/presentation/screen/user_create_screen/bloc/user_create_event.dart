part of 'user_create_bloc.dart';

@immutable
sealed class UserCreateEvent {}

final class UserCreateInitEvent extends UserCreateEvent {}

final class UserCreateAddEvent extends UserCreateEvent {
  final String name;
  final String email;
  final String phone;
  final String address;

  UserCreateAddEvent({required this.name, required this.email, required this.phone, required this.address});
}