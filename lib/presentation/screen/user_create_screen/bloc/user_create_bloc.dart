import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:risky_coin/domain/entity/user_entity.dart';
import 'package:risky_coin/domain/use_case/user_use_case/create_user_use_case.dart';
import 'package:risky_coin/presentation/di/config_di.dart';

part 'user_create_event.dart';
part 'user_create_state.dart';

class UserCreateBloc extends Bloc<UserCreateEvent, UserCreateState> {
  UserCreateBloc() : super(UserCreateInitial()) {
    on<UserCreateInitEvent>(_init);
    on<UserCreateAddEvent>(_add);
  }

  final CreateUserUseCase _createUserUseCase = ConfigDi().injector.get();

  Future<void> _init(UserCreateInitEvent event, Emitter<UserCreateState> emit) async {
    emit(UserCreateLoading());
    try {
      emit(UserCreateLoaded());
    } catch (e) {
      emit(UserCreateError(e.toString()));
    }
  }

  Future<void> _add(UserCreateAddEvent event, Emitter<UserCreateState> emit) async {
    emit(UserCreateLoading());
    try {
      if(event.name.isEmpty || event.email.isEmpty || event.phone.isEmpty || event.address.isEmpty) {
        emit(UserCreateError("Vui lòng điền đủ thông tin"));
        emit(UserCreateLoaded());
        return;
      }
      else {
        final user = UserEntity(
          name: event.name,
          email: event.email,
          phone: event.phone,
          address: event.address,
        );
        await _createUserUseCase(user);
        emit(UserCreateSuccess());
      }
    } catch (e) {
      emit(UserCreateError(e.toString()));
    }
  }
}
