import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, path: '/login', initial: true),
    AutoRoute(page: RegisterRoute.page, path: '/signup'),
    AutoRoute(page: HomeRoute.page, path: '/home'),
    AutoRoute(page: ProductRoute.page, path: '/product'),
    AutoRoute(page: ProductDetailRoute.page, path: '/product-detail'),
    AutoRoute(page: ProductCreateRoute.page, path: '/product-create'),
    AutoRoute(page: UserRoute.page, path: '/user'),
    AutoRoute(page: UserDetailRoute.page, path: '/user-detail'),
    AutoRoute(page: UserCreateRoute.page, path: '/user-create'),
  ];
}