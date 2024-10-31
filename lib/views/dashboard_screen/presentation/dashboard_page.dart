import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qualifacts_case/router/app_router.gr.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';

@RoutePage(name: 'DashboardPageRoute')
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        lazyLoad: true,
        routes: const [
          HomePageRoute(),
          FavoriteCharacterPageRoute(),
        ],
        resizeToAvoidBottomInset: false,
      transitionBuilder: (context, child, animation) => child,
        bottomNavigationBuilder: (context, tabsRouter) => BottomNavigationBar(
          backgroundColor: ColorsConstant.black,
          currentIndex: tabsRouter.activeIndex,
          selectedItemColor: ColorsConstant.moonstone,
          unselectedItemColor: Colors.grey,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
          ],
        ),
    );
  }
}
