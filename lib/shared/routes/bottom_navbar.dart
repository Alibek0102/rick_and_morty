import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constants/app_colors.dart';
import 'package:rick_and_morty/shared/routes/app_routes.gr.dart';

@RoutePage()
class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [ActorsRoute(), FavoritesRoute()],
      builder: (BuildContext context, Widget child, _) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
              elevation: 10,
              backgroundColor: Colors.white,
              selectedIconTheme:
                  const IconThemeData(size: 30, color: Colors.blue),
              unselectedIconTheme:
                  const IconThemeData(size: 30, color: AppColors.gray),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
              ]),
        );
      },
    );
  }
}
