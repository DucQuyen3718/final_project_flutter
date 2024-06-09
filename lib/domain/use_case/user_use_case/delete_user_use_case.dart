import 'package:risky_coin/domain/repository/user_repository.dart';

class DeleteUserUseCase {
  final UserRepository _userRepository;

  DeleteUserUseCase(this._userRepository);

  Future<void> call(String id) async {
    return _userRepository.deleteUser(id);
  }
}