import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shamo/core/core.dart';
import 'package:shamo/features/chat/chat.dart';
import 'package:shamo/features/user/data/models/user_model.dart';
import 'package:shamo/injection_container.dart';

part 'router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(RouterInitial());
  final _sharedPreferencesHelper = sl<SharedPreferencesHelper>();

  void onSplashPage() async {
    FlutterNativeSplash.remove();
    emit(OnSplashPage());
    UserModel userModel = await _sharedPreferencesHelper.getUserPreferences();
    if (userModel.id == null) {
      Future.delayed(const Duration(seconds: 3), () {
        emit(OnSignInPage());
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        emit(OnHomePage());
      });
    }
  }

  void onSignInPage() async {
    emit(OnSignInPage());
  }

  void onSignUpPage() async {
    emit(OnSignUpPage());
  }

  void onHomePage() async {
    emit(OnHomePage());
  }

  void onChatDetailPage({ChatModel? chatModel}) async {
    emit(OnChatDetailPage(chatModel: chatModel));
  }
}
