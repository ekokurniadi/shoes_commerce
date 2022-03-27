import 'package:connectivity/connectivity.dart';

class ConnectionHelper {
  static Future<bool> checkConnection() async {
    var connectionResult = await Connectivity().checkConnectivity();
    if (connectionResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectionResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
