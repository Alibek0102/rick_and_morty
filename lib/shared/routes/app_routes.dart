import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/shared/routes/app_routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: BottomNavbar.page, initial: true, children: [
          AutoRoute(page: ActorsRoute.page),
          AutoRoute(page: FavoritesRoute.page)
        ])
      ];
}
