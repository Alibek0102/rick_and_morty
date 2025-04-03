// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:rick_and_morty/feature/actors/presentation/screens/actors_screen.dart'
    as _i1;
import 'package:rick_and_morty/feature/favorites/presentation/screens/favorites_screen.dart'
    as _i3;
import 'package:rick_and_morty/shared/routes/bottom_navbar.dart' as _i2;

/// generated route for
/// [_i1.ActorsScreen]
class ActorsRoute extends _i4.PageRouteInfo<void> {
  const ActorsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ActorsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActorsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.ActorsScreen();
    },
  );
}

/// generated route for
/// [_i2.BottomNavbar]
class BottomNavbar extends _i4.PageRouteInfo<void> {
  const BottomNavbar({List<_i4.PageRouteInfo>? children})
      : super(
          BottomNavbar.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavbar';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.BottomNavbar();
    },
  );
}

/// generated route for
/// [_i3.FavoritesScreen]
class FavoritesRoute extends _i4.PageRouteInfo<void> {
  const FavoritesRoute({List<_i4.PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.FavoritesScreen();
    },
  );
}
