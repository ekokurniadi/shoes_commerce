import 'package:get_it/get_it.dart';
import 'package:shamo/core/router/cubit/router_cubit.dart';
import 'package:shamo/core/utility/shared_preferences_helper.dart';
import 'package:shamo/features/beranda/presentation/cubit/categories_cubit.dart';
import 'package:shamo/features/chat/data/repositories/chat_repositories_impl.dart';
import 'package:shamo/features/chat/data/resources/chat_local_data_source.dart';
import 'package:shamo/features/chat/data/resources/chat_local_data_source_impl.dart';
import 'package:shamo/features/chat/domain/repositories/chat_repositories.dart';
import 'package:shamo/features/chat/domain/usecases/get_list_message.dart'
    as us;
import 'package:shamo/features/chat/presentation/cubit/chat_cubit.dart';

import 'package:shamo/features/home/presentation/cubit/bottom_navigation_cubit.dart';

final sl = GetIt.instance;
Future<void> initials() async {
  // cubit
  sl.registerFactory(() => RouterCubit());
  sl.registerFactory(() => BottomNavigationCubit());
  sl.registerFactory(() => CategoriesCubit());
  sl.registerFactory(() => ChatCubit(getListMessage: sl()));

  // shared preferences helper
  sl.registerLazySingleton(() => SharedPreferencesHelper());

  // usecases
  sl.registerLazySingleton(() => us.GetListMessage(chatRepositories: sl()));

  // repositories
  sl.registerLazySingleton<ChatRepositories>(
      () => ChatRepositoriesImpl(chatLocalDataSourceImpl: sl()));

  // datasource
  sl.registerLazySingleton<ChatLocalDataSource>(
      () => ChatLocalDataSourceImpl());
}
