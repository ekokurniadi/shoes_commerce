import 'package:get_it/get_it.dart';

import 'core/core.dart';
import 'features/beranda/beranda.dart';
import 'features/chat/chat.dart';
import 'features/home/home.dart';
import 'features/login/login.dart';
import 'features/product/product.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';
import 'features/signup/signup.dart';

final sl = GetIt.instance;

Future<void> initials() async {
  // cubit
  sl.registerFactory(() => RouterCubit());

  sl.registerFactory(() => BottomNavigationCubit());

  sl.registerFactory(() => CategoriesCubit());

  sl.registerFactory(() => ChatCubit(getListMessage: sl()));

  sl.registerFactory(() => LoginCubit(useCaseLogin: sl()));

  sl.registerFactory(() => SignupCubit(signUpUseCase: sl()));

  sl.registerFactory(() => ValidatorCubit());

  sl.registerFactory(() => ProfileCubit());

  sl.registerFactory(() => ProductCubit(
        getProductUsecase: sl(),
        getPopularProductUsecase: sl(),
      ));
  // toast helper
  sl.registerLazySingleton(() => ToastHelper());

  // shared preferences helper
  sl.registerLazySingleton(() => SharedPreferencesHelper());

  // usecases
  sl.registerLazySingleton(() => GetListMessage(chatRepositories: sl()));

  sl.registerLazySingleton(() => UseCaseLogin(loginRepositories: sl()));

  sl.registerLazySingleton(() => SignUpUseCase(signUpRepositories: sl()));

  sl.registerLazySingleton(
      () => GetProductUsecase(productRemoteDataSource: sl()));
  sl.registerLazySingleton(
      () => GetPopularProductUsecase(productRemoteDataSource: sl()));

  // repositories
  sl.registerLazySingleton<ChatRepositories>(
      () => ChatRepositoriesImpl(chatLocalDataSourceImpl: sl()));

  sl.registerLazySingleton<LoginRepositories>(
      () => LoginUserRepositoriesImpl(loginNetworkDataSource: sl()));

  sl.registerLazySingleton<SignUpRepositories>(
      () => SignUpRepositoriesImpl(signUpRemoteDataSource: sl()));

  sl.registerFactory<ProductRepositories>(
      () => ProductRepositoriesImpl(productRemoteDataSource: sl()));

  // datasource
  sl.registerLazySingleton<ChatLocalDataSource>(
    () => ChatLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<LoginNetworkDataSource>(
    () => LoginNetworkDataSourceImpl(),
  );

  sl.registerLazySingleton<SignUpRemoteDataSource>(
    () => SignUpRemoteDataSourceImpl(),
  );

  sl.registerFactory<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(),
  );
}
