import 'package:dio/dio.dart';
import 'package:flutter_app/app/app_prefs.dart';
import 'package:flutter_app/data/data_sources/remote/remote_data_source.dart';
import 'package:flutter_app/data/data_sources/remote/remote_data_source_impl.dart';
import 'package:flutter_app/data/network/app_api.dart';
import 'package:flutter_app/data/network/dio_instance/dio_factory.dart';
import 'package:flutter_app/data/network/internet_checker/network_info.dart';
import 'package:flutter_app/data/network/internet_checker/network_info_impl.dart';
import 'package:flutter_app/data/repository/repository_impl.dart';
import 'package:flutter_app/domain/repository/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, all generic dependencies are here

  // shared preferences instance
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app preferences instance
  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferences(instance<SharedPreferences>()),
  );

  // network info instance
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(InternetConnectionChecker()),
  );

  // dio factory instance
  instance.registerFactory<DioFactory>(
    () => DioFactory(instance<AppPreferences>()),
  );

  // app service client instance
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(
    () => AppServiceClient(dio),
  );

  // remote data source instance
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(instance<AppServiceClient>()),
  );

  // repository instance
  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(instance<RemoteDataSource>(), instance<NetworkInfo>()),
  );
}
