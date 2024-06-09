import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:risky_coin/domain/entity/user_entity.dart';
import 'package:risky_coin/domain/use_case/user_use_case/delete_user_use_case.dart';
import 'package:risky_coin/domain/use_case/user_use_case/get_user_use_case.dart';
import 'package:risky_coin/domain/use_case/user_use_case/update_user_use_case.dart';
import 'package:risky_coin/presentation/di/config_di.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  UserDetailBloc() : super(UserDetailInitial()) {
    on<UserDetailInitEvent>(_init);
    on<UserDetailDeleteEvent>(_delete);
    on<UserDetailUpdateEvent>(_update);
  }

  final GetUserUseCase _getUserUseCase = ConfigDi().injector.get();
  final DeleteUserUseCase _deleteUserUseCase = ConfigDi().injector.get();
  final UpdateUserUseCase _updateUserUseCase = ConfigDi().injector.get();

  Future<void> _init(UserDetailInitEvent event, Emitter<UserDetailState> emit) async {
    emit(UserDetailLoading());
    try {
      final user = await _getUserUseCase.call(event.id);
      emit(UserDetailLoaded(userEntity: user));
    } catch (e) {
      emit(UserDetailError(message: e.toString()));
    }
  }

  Future<void> _delete(UserDetailDeleteEvent event, Emitter<UserDetailState> emit) async {
    emit(UserDetailLoading());
    try {
      await _deleteUserUseCase.call(event.id);
      emit(UserDetailDeleted());
    } catch (e) {
      emit(UserDetailError(message: e.toString()));
    }
  }

  Future<void> _update(UserDetailUpdateEvent event, Emitter<UserDetailState> emit) async {
    emit(UserDetailLoading());
    try {
      await _updateUserUseCase.call(event.userEntity);
      emit(UserDetailUpdated());
    } catch (e) {
      emit(UserDetailError(message: e.toString()));
    }
  }
}
