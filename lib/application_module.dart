import 'package:flutter/foundation.dart';
import 'package:flutter_flipperkit/flipper_client.dart';
import 'package:flutter_flipperkit/plugins/network/flipper_network_plugin.dart';
import 'package:flutter_flipperkit/plugins/sharedpreferences/flipper_shared_preferences_plugin.dart';

import 'core/core.dart';

class AppModule {
  Future<void> init() async {
    /// DIO INITIAL
    DioHelper.initDio(ConstantHelper.BASE_URL);
    DioHelper.setDioInterceptor(ConstantHelper.BASE_URL);

    /// FLIPPER CLIENT
    if (!kReleaseMode) {
      FlipperClient flipperClient = FlipperClient.getDefault();
      flipperClient.addPlugin(FlipperNetworkPlugin());
      flipperClient.addPlugin(FlipperSharedPreferencesPlugin());
      flipperClient.start();
    }
  }
}
