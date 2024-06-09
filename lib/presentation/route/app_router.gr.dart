// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/cupertino.dart' as _i12;
import 'package:flutter/material.dart' as _i11;
import 'package:risky_coin/presentation/screen/home_screen/home_screen.dart'
    as _i1;
import 'package:risky_coin/presentation/screen/login_screen/login_screen.dart'
    as _i2;
import 'package:risky_coin/presentation/screen/product_create_screen/product_create_screen.dart'
    as _i3;
import 'package:risky_coin/presentation/screen/product_detail_screen/product_detail_screen.dart'
    as _i4;
import 'package:risky_coin/presentation/screen/product_screen/product_screen.dart'
    as _i5;
import 'package:risky_coin/presentation/screen/register_screen/register_screen.dart'
    as _i6;
import 'package:risky_coin/presentation/screen/user_create_screen/user_create_screen.dart'
    as _i7;
import 'package:risky_coin/presentation/screen/user_detail_screen/user_detail_screen.dart'
    as _i8;
import 'package:risky_coin/presentation/screen/user_screen/user_screen.dart'
    as _i9;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.LoginScreen(key: args.key),
      );
    },
    ProductCreateRoute.name: (routeData) {
      final args = routeData.argsAs<ProductCreateRouteArgs>(
          orElse: () => const ProductCreateRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ProductCreateScreen(key: args.key),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ProductDetailScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    ProductRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProductScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.RegisterScreen(key: args.key),
      );
    },
    UserCreateRoute.name: (routeData) {
      final args = routeData.argsAs<UserCreateRouteArgs>(
          orElse: () => const UserCreateRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.UserCreateScreen(key: args.key),
      );
    },
    UserDetailRoute.name: (routeData) {
      final args = routeData.argsAs<UserDetailRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.UserDetailScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    UserRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.UserScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<LoginRouteArgs> page =
      _i10.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.ProductCreateScreen]
class ProductCreateRoute extends _i10.PageRouteInfo<ProductCreateRouteArgs> {
  ProductCreateRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          ProductCreateRoute.name,
          args: ProductCreateRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProductCreateRoute';

  static const _i10.PageInfo<ProductCreateRouteArgs> page =
      _i10.PageInfo<ProductCreateRouteArgs>(name);
}

class ProductCreateRouteArgs {
  const ProductCreateRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'ProductCreateRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.ProductDetailScreen]
class ProductDetailRoute extends _i10.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i12.Key? key,
    required int id,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          ProductDetailRoute.name,
          args: ProductDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static const _i10.PageInfo<ProductDetailRouteArgs> page =
      _i10.PageInfo<ProductDetailRouteArgs>(name);
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i12.Key? key;

  final int id;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i5.ProductScreen]
class ProductRoute extends _i10.PageRouteInfo<void> {
  const ProductRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RegisterScreen]
class RegisterRoute extends _i10.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i10.PageInfo<RegisterRouteArgs> page =
      _i10.PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.UserCreateScreen]
class UserCreateRoute extends _i10.PageRouteInfo<UserCreateRouteArgs> {
  UserCreateRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          UserCreateRoute.name,
          args: UserCreateRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UserCreateRoute';

  static const _i10.PageInfo<UserCreateRouteArgs> page =
      _i10.PageInfo<UserCreateRouteArgs>(name);
}

class UserCreateRouteArgs {
  const UserCreateRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'UserCreateRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.UserDetailScreen]
class UserDetailRoute extends _i10.PageRouteInfo<UserDetailRouteArgs> {
  UserDetailRoute({
    _i11.Key? key,
    required String id,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          UserDetailRoute.name,
          args: UserDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'UserDetailRoute';

  static const _i10.PageInfo<UserDetailRouteArgs> page =
      _i10.PageInfo<UserDetailRouteArgs>(name);
}

class UserDetailRouteArgs {
  const UserDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i11.Key? key;

  final String id;

  @override
  String toString() {
    return 'UserDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i9.UserScreen]
class UserRoute extends _i10.PageRouteInfo<void> {
  const UserRoute({List<_i10.PageRouteInfo>? children})
      : super(
          UserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
