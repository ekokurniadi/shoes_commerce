part of '../../signup.dart';

abstract class SignUpRepositories {
  Future<Either<Failures, UserModel>> signUpUser(
      String name, String userName, String email, String password);
}
