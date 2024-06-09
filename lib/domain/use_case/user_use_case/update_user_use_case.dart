import 'package:risky_coin/domain/entity/user_entity.dart';
import 'package:risky_coin/domain/repository/user_repository.dart';

class UpdateUserUseCase {
  final UserRepository _userRepository;

  UpdateUserUseCase(this._userRepository);

  Future<void> call(UserEntity userEntity) async {
    return _userRepository.updateUser(userEntity);
  }
}