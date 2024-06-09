import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:risky_coin/domain/entity/user_entity.dart';
import 'package:risky_coin/domain/use_case/product_use_case/get_all_product_use_case.dart';
import 'package:risky_coin/domain/use_case/user_use_case/get_all_user_use_case.dart';
import 'package:risky_coin/presentation/di/config_di.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserInitEvent>(_init);
  }

  final GetAllUserUseCase _getUserProfileUseCase = ConfigDi().injector.get();

  Future<void> _init(UserInitEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final users = await _getUserProfileUseCase.call();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
