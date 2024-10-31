import 'package:auto_route/auto_route.dart';
import 'package:qualifacts_case/router/app_router_path.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<CustomRoute> get routes => [
    CustomRoute(
      initial: true,
      page: SplashScreenPageRoute.page,
      path: AppRoutePath.splashScreenPath,
    ),
    CustomRoute(
      page: HomePageRoute.page,
      path: AppRoutePath.homeScreenPath,
    ),
    CustomRoute(
      page: CharacterPageRoute.page,
      path: AppRoutePath.characterScreenPath,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
  ];
}
