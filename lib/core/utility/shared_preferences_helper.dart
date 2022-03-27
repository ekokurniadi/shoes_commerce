import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  Future<String?> getUserID() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    String? userID = _sharedPreferences.getString("userID");
    return userID;
  }
}
