part of '../../signup.dart';

class SignUpUseCase {
  final SignUpRepositories signUpRepositories;
  SignUpUseCase({required this.signUpRepositories});

  Future<Either<Failures, UserModel>> call({
    required String name,
    required String userName,
    required String email,
    required String password,
  }) async {
    return await signUpRepositories.signUpUser(
      name: name,
      userName: userName,
      email: email,
      password: password,
    );
  }
}
