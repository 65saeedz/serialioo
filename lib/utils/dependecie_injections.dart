import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_show_app/services/api_sevices.dart';

final dependencyLocator = GetIt.instance;

void setupGetItDependencies() {
  dependencyLocator.registerLazySingleton<ApiService>(() => ApiService(Dio()));
}
