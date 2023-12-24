import 'package:booklify/core/utils/api/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../features/home/data/repos/home_repo_impl.dart';

class ServiceLocator {
  final sl = GetIt.instance;

  void setup() {
    sl.registerSingleton<Dio>(Dio());
    sl.registerSingleton<ApiService>(ApiService(sl.get<Dio>()));
    sl.registerSingleton<HomeRepoImpl>(HomeRepoImpl(sl.get<ApiService>()));
  }
}
