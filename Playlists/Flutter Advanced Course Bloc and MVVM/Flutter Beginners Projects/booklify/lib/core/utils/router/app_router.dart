import 'package:booklify/features/search/presentation/view_model/search_for_a_book_cubit/search_for_a_book_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/home/data/book_model/book_model.dart';
import '../../../features/home/data/repos/home_repo_impl.dart';
import '../../../features/home/presentation/view/pdf_viewer_view.dart';
import '../../../features/home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';
import '../../../features/search/data/repos/search_for_a_book_repo_impl.dart';
import '../../../features/views.dart';
import '../service_locator/service_locator.dart';
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
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (context) =>
              SimilarBooksCubit(ServiceLocator().sl.get<HomeRepoImpl>())
                ..fetchSimilarBooks(
                  category:
                      (state.extra as BookModel).volumeInfo.categories![0],
                ),
          child: BookDetailsView(
            book: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: RoutesStrings.pdfViewerView,
        builder: (BuildContext context, GoRouterState state) => PdfViewerView(
          book: state.extra as BookModel,
        ),
      ),
      GoRoute(
        path: RoutesStrings.searchView,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (context) => SearchForABookCubit(
            ServiceLocator().sl.get<SearchForABookRepoImpl>(),
          ),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
