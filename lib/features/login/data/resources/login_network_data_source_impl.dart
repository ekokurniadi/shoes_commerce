part of '../../login.dart';

class LoginNetworkDataSourceImpl extends LoginNetworkDataSource {
  @override
  Future<UserModel> loginUser(String email, String password) async {
    UserModel userModel;

    Response response = await DioHelper.dio!.post(
      ConstantHelper.BASE_URL + "/login",
      data: {'email': email, 'password': password},
    );

    userModel = UserModel.fromJson(response.data['data']);
    return userModel;
  }
}
