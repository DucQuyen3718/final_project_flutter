import 'package:risky_coin/domain/entity/user_entity.dart';
import 'package:risky_coin/domain/repository/user_repository.dart';

class CreateUserUseCase {
  final UserRepository _userRepository;

  CreateUserUseCase(this._userRepository);

  Future<void> call(UserEntity userEntity) async {
    await _userRepository.createUser(userEntity);
  }
}