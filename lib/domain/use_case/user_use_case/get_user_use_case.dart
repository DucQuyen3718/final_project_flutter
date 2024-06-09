import 'package:risky_coin/domain/repository/user_repository.dart';

import '../../entity/user_entity.dart';

class GetUserUseCase {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  Future<UserEntity> call(String id) async {
    return _userRepository.getUser(id);
  }
}