import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo/core/router/cubit/router_cubit.dart';
import 'package:shamo/features/beranda/presentation/cubit/categories_cubit.dart';
import 'package:shamo/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:shamo/features/home/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:shamo/injection_container.dart';
import 'package:shamo/wrappers.dart';

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
            create: (_) => sl<CategoriesCubit>(),
          ),
          BlocProvider(
            create: (_) => sl<ChatCubit>(),
          ),
        ],
        child: const Wrappers(),
      ),
    );
  }
}
