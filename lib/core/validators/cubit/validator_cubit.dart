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

    Map<String, bool> result = {
      "uppercase": upperCase.hasMatch(password),
      "lowercase": lowerCase.hasMatch(password),
      "number": haveNumber.hasMatch(password),
      "symbol": haveSymbol.hasMatch(password),
      "eight": greaterThanEight.hasMatch(password)
    };
    List<Map<String, dynamic>> validationResult = [];
    if (!upperCase.hasMatch(password)) {
      validationResult.add({
        "name": "uppercase",
        "value": result["uppercase"],
        "message": "Password harus mengandung huruf besar"
      });
    } else if (!lowerCase.hasMatch(password)) {
      validationResult.add({
        "name": "lowercase",
        "value": result["lowercase"],
        "message": "Password harus mengandung huruf kecil"
      });
    } else if (!haveNumber.hasMatch(password)) {
      validationResult.add({
        "name": "number",
        "value": result["number"],
        "message": "Password harus mengandung angka"
      });
    } else if (!haveSymbol.hasMatch(password)) {
      validationResult.add({
        "name": "symbol",
        "value": result["symbol"],
        "message": "Password harus mengandung simbol"
      });
    } else if (!greaterThanEight.hasMatch(password)) {
      validationResult.add({
        "name": "eight",
        "value": result["eight"],
        "message": "Password harus lebih dari 8 karakter"
      });
    } else {
      validationResult.clear();
    }

    emit(IsPasswordValid(result: validationResult));
  }

  void resetValidator() async {
    emit(ValidatorInitial());
  }
}
