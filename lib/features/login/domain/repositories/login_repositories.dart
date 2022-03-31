part of '../../login.dart';

abstract class LoginRepositories {
  Future<Either<Failures, UserModel>> loginUser(String email, String password);
}
