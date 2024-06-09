import 'package:risky_coin/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUser(String id);
  Future<List<UserEntity>> getAllUser();
  Future<void> createUser(UserEntity user);
  Future<void> updateUser(UserEntity user);
  Future<void> deleteUser(String id);
}