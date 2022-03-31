part of '../../login.dart';

abstract class LoginNetworkDataSource {
  Future<UserModel> loginUser(String email, String password);
}
