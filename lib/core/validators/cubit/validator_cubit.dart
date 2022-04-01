import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';

part 'validator_state.dart';

class ValidatorCubit extends Cubit<ValidatorState> {
  ValidatorCubit() : super(ValidatorInitial());

  Future<void> validateEmail(String email) async {
    bool isValid = EmailValidator.validate(email);
    if (!isValid) {
      emit(const IsEmailValid(message: "Format email tidak sesuai"));
    } else {
      emit(const IsEmailValid(message: ""));
    }
  }

  Future<void> validatePassword(String password) async {
    RegExp upperCase = RegExp(r'^(?=.*?[A-Z])');
    RegExp lowerCase = RegExp(r'^(?=.*?[a-z])');
    RegExp haveSymbol = RegExp(r'^(?=.*?[!@#\$&*~])');
    RegExp haveNumber = RegExp(r'^(?=.*?[0-9])');
    RegExp greaterThanEight = RegExp(r'^.{8,}$');
    List<String> isPasswordValid = [];

    if (!upperCase.hasMatch(password)) {
      isPasswordValid.add("Password harus mengandung huruf besar");
    } else if (!lowerCase.hasMatch(password)) {
      isPasswordValid.add("Password harus mengandung huruf kecil");
    } else if (!haveNumber.hasMatch(password)) {
      isPasswordValid.add("Password harus mengandung angka");
    } else if (!haveSymbol.hasMatch(password)) {
      isPasswordValid.add("Password harus mengandung simbol");
    } else if (!greaterThanEight.hasMatch(password)) {
      isPasswordValid.add("Password minimal 8 karakter");
    } else {
      isPasswordValid.clear();
    }

    emit(IsPasswordValid(result: isPasswordValid));
  }

  void resetValidator() async {
    emit(ValidatorInitial());
  }

  void validateNameInput(String name) async {
    if (name == "") {
      emit(const NameIsEmpty(message: "Nama tidak boleh kosong"));
    } else {
      emit(const NameIsEmpty(message: ""));
    }
  }

  void validateUserNameInput(String username) {
    if (username == "") {
      emit(const UserNameIsEmpty(message: "Username tidak boleh kosong"));
    } else {
      emit(const UserNameIsEmpty(message: ""));
    }
  }
}
