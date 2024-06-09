import 'package:risky_coin/domain/entity/user_entity.dart';
import 'package:risky_coin/domain/repository/user_repository.dart';

class GetAllUserUseCase {
  final UserRepository _userRepository;

  GetAllUserUseCase(this._userRepository);

  Future<List<UserEntity>> call() {
    return _userRepository.getAllUser();
  }
}