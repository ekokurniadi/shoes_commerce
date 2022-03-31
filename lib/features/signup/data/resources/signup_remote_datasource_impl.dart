part of '../../signup.dart';

class SignUpRemoteDataSourceImpl extends SignUpRemoteDataSource {
  @override
  Future<Either<Failures, UserModel>> signUpUser(
      String name, String userName, String email, String password) {
    throw UnimplementedError();
  }
}
