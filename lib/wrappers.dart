import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/signup/presentation/pages/signup_page.dart';
import 'features/splash_screen/presentation/pages/splash_page.dart';

import 'core/core.dart';
import 'features/chat/chat.dart';
import 'features/home/home.dart';
import 'features/login/login.dart';

class Wrappers extends StatelessWidget {
  const Wrappers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RouterCubit>(context).onSplashPage();
    return Scaffold(
      body: BlocBuilder<RouterCubit, RouterState>(
        builder: (_, state) {
          if (state is RouterInitial) {
            return const SplashPage();
          } else if (state is OnSplashPage) {
            return const SplashPage();
          } else if (state is OnSignInPage) {
            return const LoginPage();
          } else if (state is OnSignUpPage) {
            return const SignUpPage();
          } else if (state is OnHomePage) {
            return const HomePage();
          } else if (state is OnChatDetailPage) {
            return DetailChat(chatModel: state.chatModel!);
          }
          return Container();
        },
      ),
    );
  }
}
