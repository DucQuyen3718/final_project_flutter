import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:risky_coin/data/data_source/database_user.dart';
import 'package:risky_coin/data/model/user_model.dart';
import 'package:risky_coin/domain/entity/user_entity.dart';
import 'package:risky_coin/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final DatabaseUser _databaseUser = DatabaseUser.db;

  @override
  Future<void> createUser(UserEntity user) {
    return _databaseUser.createUser(
        UserModel(
          id: user.id,
          name: user.name,
          email: user.email,
          phone: user.phone,
          address: user.address,
        )
    );
  }

  @override
  Future<void> deleteUser(String id) {
    return _databaseUser.deleteUser(id);
  }

  @override
  Future<List<UserEntity>> getAllUser() {
    return _databaseUser.getAllUser();
  }

  @override
  Future<UserEntity> getUser(String id) {
    return _databaseUser.getUser(id);
  }

  @override
  Future<void> updateUser(UserEntity user) {
    return _databaseUser.updateUser(
        UserModel(
          id: user.id,
          name: user.name,
          email: user.email,
          phone: user.phone,
          address: user.address,
        )
    );
  }
}