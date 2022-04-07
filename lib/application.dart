import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/core.dart';
import 'features/category/category.dart';

import 'features/chat/chat.dart';
import 'features/home/home.dart';
import 'features/login/login.dart';
import 'features/product/product.dart';

import 'features/signup/signup.dart';
import 'features/user/user.dart';
import 'injection_container.dart';
import 'router_module.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

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
            create: (_) => sl<ProductCubit>(),
          ),
          BlocProvider(
            create: (_) => sl<CategoryCubit>(),
          ),
          BlocProvider(
            create: (_) => sl<PopularProductCubit>(),
          ),
        ],
        child: const RouterModule(),
      ),
    );
  }
}
