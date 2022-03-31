part of '../../login.dart';

class LoginUserRepositoriesImpl extends LoginRepositories {
  final LoginNetworkDataSource loginNetworkDataSource;
  LoginUserRepositoriesImpl({required this.loginNetworkDataSource});
  @override
  Future<Either<Failures, UserModel>> loginUser(
      String email, String password) async {
    try {
      final result = await loginNetworkDataSource.loginUser(email, password);
      return Right(result);
    } on DioError catch (e) {
      return Left(ServerFailures(errorMessage: e.message));
    }
  }
}
