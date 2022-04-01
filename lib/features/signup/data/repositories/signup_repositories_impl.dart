part of '../../signup.dart';

class SignUpRepositoriesImpl extends SignUpRepositories {
  final SignUpRemoteDataSource signUpRemoteDataSource;
  SignUpRepositoriesImpl({required this.signUpRemoteDataSource});
  @override
  Future<Either<Failures, UserModel>> signUpUser({
    required String name,
    required String userName,
    required String email,
    required String password,
  }) async {
    final result = await signUpRemoteDataSource.signUpUser(
      name: name,
      userName: userName,
      email: email,
      password: password,
    );
    return result;
  }
}
