import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core.dart';
import '../../../../core/error/failures.dart';
import '../../../../injection_container.dart';
import '../../login.dart';

import '../../../user/data/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UseCaseLogin useCaseLogin;
  LoginCubit({required this.useCaseLogin}) : super(LoginInitial());

  Future<void> loginUser(String email, String password) async {
    final SharedPreferencesHelper _sharedPreferencesHelper =
        sl<SharedPreferencesHelper>();
    emit(LoginOnProcess());
    if (email.isEmpty || password.isEmpty) {
      emit(LoginError(
        errorMessage: ServerFailures(
          errorMessage: "Silahkan cek kembali inputan anda",
        ),
      ));
      Future.delayed(const Duration(seconds: 1), () {
        emit(LoginInitial());
      });
      return;
    }
    final result = await useCaseLogin.call(email, password);

    result.fold((failures) async {
      emit(LoginError(errorMessage: failures));
      Future.delayed(const Duration(seconds: 1), () {
        emit(LoginInitial());
      });
    }, (response) async {
      await _sharedPreferencesHelper.setUserPreferences(response);
      emit(LoginSuccess(userModel: response));
      sl<ValidatorCubit>().emit(ValidatorInitial());
    });
  }

  Future<void> userLogout(BuildContext context) async {
    final SharedPreferencesHelper _sharedPreferencesHelper =
        sl<SharedPreferencesHelper>();
    emit(LogOutOnProcess());
    await _sharedPreferencesHelper.resetUserPreferences().then((value) {
      emit(LogOutSuccess());
      BlocProvider.of<RouterCubit>(context).onSignInPage();
      BlocProvider.of<ValidatorCubit>(context).resetValidator();
    });
  }
}
