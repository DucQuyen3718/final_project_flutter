import 'package:get_it/get_it.dart';
import 'package:risky_coin/data/repository/auth_repository_impl.dart';
import 'package:risky_coin/data/repository/product_repository_impl.dart';
import 'package:risky_coin/data/repository/user_repository_impl.dart';
import 'package:risky_coin/domain/repository/auth_repository.dart';
import 'package:risky_coin/domain/repository/product_repository.dart';
import 'package:risky_coin/domain/repository/user_repository.dart';
import 'package:risky_coin/domain/use_case/product_use_case/create_product_use_case.dart';
import 'package:risky_coin/domain/use_case/product_use_case/delete_product_use_case.dart';
import 'package:risky_coin/domain/use_case/product_use_case/get_all_product_use_case.dart';
import 'package:risky_coin/domain/use_case/auth_use_case/login_with_email_password_use_case.dart';
import 'package:risky_coin/domain/use_case/product_use_case/get_product_use_case.dart';
import 'package:risky_coin/domain/use_case/product_use_case/update_product_use_case.dart';
import 'package:risky_coin/domain/use_case/auth_use_case/register_with_email_password_use_case.dart';
import 'package:risky_coin/domain/use_case/user_use_case/create_user_use_case.dart';
import 'package:risky_coin/domain/use_case/user_use_case/delete_user_use_case.dart';
import 'package:risky_coin/domain/use_case/user_use_case/get_all_user_use_case.dart';
import 'package:risky_coin/domain/use_case/user_use_case/get_user_use_case.dart';
import 'package:risky_coin/domain/use_case/user_use_case/update_user_use_case.dart';

class ConfigDi {
  static final ConfigDi _singleton = ConfigDi._internal();

  factory ConfigDi() {
    return _singleton;
  }

  ConfigDi._internal() {
    // use_case
    injector.registerLazySingleton<LoginWithEmailPasswordUseCase>(() => LoginWithEmailPasswordUseCase(injector.get()));
    injector.registerLazySingleton<RegisterWithEmailAndPasswordUseCase>(() => RegisterWithEmailAndPasswordUseCase(injector.get()));

    injector.registerLazySingleton<GetAllUserUseCase>(() => GetAllUserUseCase(injector.get()));
    injector.registerLazySingleton<CreateUserUseCase>(() => CreateUserUseCase(injector.get()));
    injector.registerLazySingleton<GetUserUseCase>(() => GetUserUseCase(injector.get()));
    injector.registerLazySingleton<DeleteUserUseCase>(() => DeleteUserUseCase(injector.get()));
    injector.registerLazySingleton<UpdateUserUseCase>(() => UpdateUserUseCase(injector.get()));

    injector.registerLazySingleton<GetALlProductUseCase>(() => GetALlProductUseCase(injector.get()));
    injector.registerLazySingleton<CreateProductUseCase>(() => CreateProductUseCase(injector.get()));
    injector.registerLazySingleton<GetProductUseCase>(() => GetProductUseCase(injector.get()));
    injector.registerLazySingleton<DeleteProductUseCase>(() => DeleteProductUseCase(injector.get()));
    injector.registerLazySingleton<UpdateProductUseCase>(() => UpdateProductUseCase(injector.get()));

    // repository
    injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
    injector.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
    injector.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl());

    //bloc
  }

  GetIt injector = GetIt.instance;
}