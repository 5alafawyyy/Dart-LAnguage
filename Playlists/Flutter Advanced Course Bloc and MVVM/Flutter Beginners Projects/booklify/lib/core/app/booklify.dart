import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import '../../features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import '../utils/constants/constants.dart';
import '../utils/router/app_router.dart';
import '../utils/service_locator/service_locator.dart';
import '../utils/styles/custom_theme_data.dart';

class BooklifyApp extends StatelessWidget {
  const BooklifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(ServiceLocator().sl.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(ServiceLocator().sl.get<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: CustomThemeData.themeData,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
