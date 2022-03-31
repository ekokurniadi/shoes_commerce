part of '../../login.dart';

class UseCaseLogin {
  final LoginRepositories loginRepositories;

  UseCaseLogin({required this.loginRepositories});

  Future<Either<Failures, UserModel>> call(
      String email, String password) async {
    return await loginRepositories.loginUser(email, password);
  }
}
