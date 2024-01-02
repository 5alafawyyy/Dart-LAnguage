import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/home/data/book_model/book_model.dart';
import '../../../features/views.dart';
import 'routes_string.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const SplashView(),
      ),
      GoRoute(
        path: RoutesStrings.home,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeView(),
      ),
      GoRoute(
        path: RoutesStrings.bookDetailsView,
        builder: (BuildContext context, GoRouterState state) => BookDetailsView(
          book: state.extra as BookModel,
        ),
      ),
      GoRoute(
        path: RoutesStrings.searchView,
        builder: (BuildContext context, GoRouterState state) =>
            const SearchView(),
      ),
    ],
  );
}
