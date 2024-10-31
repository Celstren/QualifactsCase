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
      page: OnboardingPageRoute.page,
      path: AppRoutePath.onboardingScreenPath,
    ),
    CustomRoute(
      page: CharacterPageRoute.page,
      path: AppRoutePath.characterScreenPath,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute(
      page: DashboardPageRoute.page,
      path: AppRoutePath.dashboardScreenPath,
      children: [
        CustomRoute(
          page: HomePageRoute.page,
          path: AppRoutePath.homeScreenPath,
        ),
        CustomRoute(
          page: FavoriteCharacterPageRoute.page,
          path: AppRoutePath.favoriteCharacterScreenPath,
        ),
      ],
    ),
  ];
}
