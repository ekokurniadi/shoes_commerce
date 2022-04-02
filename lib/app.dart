import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/core.dart';
import 'features/category/category.dart';
import 'features/chat/presentation/cubit/chat_cubit.dart';
import 'features/home/presentation/cubit/bottom_navigation_cubit.dart';
import 'features/login/login.dart';
import 'features/product/product.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';
import 'features/signup/presentation/cubit/signup_cubit.dart';
import 'injection_container.dart';
import 'wrappers.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shamo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<RouterCubit>(),
          ),
          BlocProvider(
            create: (_) => sl<BottomNavigationCubit>(),
          ),
          BlocProvider(
            create: (_) => sl<ChatCubit>(),
          ),
          BlocProvider(
            create: (_) => sl<LoginCubit>(),
          ),
          BlocProvider(
            create: (_) => sl<ValidatorCubit>(),
          ),
          BlocProvider(
            create: (_) => sl<ProfileCubit>(),
          ),
          BlocProvider(
            create: (_) => sl<SignupCubit>(),
          ),
          BlocProvider(
            lazy: false,
            create: (_) => sl<ProductCubit>(),
          ),
          BlocProvider(
            lazy: false,
            create: (_) => sl<CategoryCubit>(),
          ),
          BlocProvider(
            create: (_) => sl<PopularProductCubit>(),
          ),
        ],
        child: const Wrappers(),
      ),
    );
  }
}
