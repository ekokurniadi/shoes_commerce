import 'package:get_it/get_it.dart';
import 'package:shamo/features/profile/presentation/cubit/profile_cubit.dart';

import 'core/core.dart';
import 'features/beranda/beranda.dart';
import 'features/chat/chat.dart';
import 'features/home/home.dart';
import 'features/login/login.dart';

final sl = GetIt.instance;
Future<void> initials() async {
  // cubit
  sl.registerFactory(() => RouterCubit());
  sl.registerFactory(() => BottomNavigationCubit());
  sl.registerFactory(() => CategoriesCubit());
  sl.registerFactory(() => ChatCubit(getListMessage: sl()));
  sl.registerFactory(() => LoginCubit(useCaseLogin: sl()));
  sl.registerFactory(() => ValidatorCubit());
  sl.registerFactory(() => ProfileCubit());

  // toast helper
  sl.registerLazySingleton<ToastHelper>(() => ToastHelper());

  // shared preferences helper
  sl.registerLazySingleton(() => SharedPreferencesHelper());

  // usecases
  sl.registerLazySingleton<GetListMessage>(
      () => GetListMessage(chatRepositories: sl()));
  sl.registerLazySingleton<UseCaseLogin>(
      () => UseCaseLogin(loginRepositories: sl()));

  // repositories
  sl.registerLazySingleton<ChatRepositories>(
      () => ChatRepositoriesImpl(chatLocalDataSourceImpl: sl()));

  sl.registerLazySingleton<LoginRepositories>(
      () => LoginUserRepositoriesImpl(loginNetworkDataSource: sl()));

  // datasource
  sl.registerLazySingleton<ChatLocalDataSource>(
      () => ChatLocalDataSourceImpl());
  sl.registerLazySingleton<LoginNetworkDataSource>(
      () => LoginNetworkDataSourceImpl());
}
