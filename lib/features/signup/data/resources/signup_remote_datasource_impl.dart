part of '../../signup.dart';

class SignUpRemoteDataSourceImpl extends SignUpRemoteDataSource {
  @override
  Future<Either<Failures, UserModel>> signUpUser({
    required String name,
    required String userName,
    required String email,
    required String password,
  }) async {
    UserModel userModel;
    try {
      Response response = await DioHelper.dio!.post(
        ConstantHelper.BASE_URL + "/register",
        data: {
          'name': name,
          'username': userName,
          'email': email,
          'password': password,
        },
      );

      userModel = UserModel.fromJson(response.data['data']);
      return Right(userModel);
    } on DioError catch (e) {
      return Left(ServerFailures(errorMessage: e.message));
    }
  }
}
