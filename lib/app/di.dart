import 'package:dreamlabs/domain/usecase/home_usecase.dart';
import 'package:dreamlabs/presentation/home/home_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../data/data_source/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network/network_info.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(InternetConnection()),
  );

  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  final dio = await instance<DioFactory>().getDio();
  instance
      .registerLazySingleton<AppServiceClient>(() => AppServiceClientImpl(dio));

  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(instance()),
  );

  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(instance(), instance()),
  );
}

void initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}
