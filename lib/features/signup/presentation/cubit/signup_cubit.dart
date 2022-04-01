import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo/core/error/failures.dart';
import 'package:shamo/features/profile/data/models/user_model.dart';

import '../../signup.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignUpUseCase signUpUseCase;
  SignupCubit({required this.signUpUseCase}) : super(SignupInitial());

  Future<void> signUpUser({
    required String name,
    required String userName,
    required String email,
    required String password,
  }) async {
    emit(OnSignupLoading());
    final result = await signUpUseCase.call(
        name: name, userName: userName, email: email, password: password);
    result.fold((failures) {
      emit(OnSignupError(errorMessage: failures));
    }, (response) {
      emit(OnSignupSuccess(userModel: response));
      Future.delayed(const Duration(seconds: 1), () {
        emit(SignupInitial());
      });
    });
  }
}
