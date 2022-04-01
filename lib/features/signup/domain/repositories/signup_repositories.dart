part of '../../signup.dart';

abstract class SignUpRepositories {
  Future<Either<Failures, UserModel>> signUpUser({
    required String name,
    required String userName,
    required String email,
    required String password,
  });
}
