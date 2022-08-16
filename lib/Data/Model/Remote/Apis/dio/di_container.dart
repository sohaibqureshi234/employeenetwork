import 'package:dio/dio.dart';
import 'package:employeenetwork/Data/Model/Remote/Apis/dio/dio_client.dart';
import 'package:employeenetwork/Data/Model/Remote/Apis/dio/logging_interceptor.dart';
import 'package:employeenetwork/Data/repositries/auth_repo.dart';
import 'package:employeenetwork/provider/auth_provider.dart';
import 'package:employeenetwork/utill/app_constants.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(),
      loggingInterceptor: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(
          () => AuthRepo(dioClient: sl(), sharedPreferences: sl()));

  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
