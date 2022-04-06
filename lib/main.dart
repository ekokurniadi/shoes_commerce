import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_flipperkit/flutter_flipperkit.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app.dart';
import 'core/core.dart';
import 'core/utility/bloc_observer.dart';
import 'injection_container.dart' as di;

void main() async {
  /// ENSURE WIDGETSBINDING IS INITIALIZED
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// DEPENDENCY INJECTION INITIAL
  await di.initials();

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

  /// BLOC OBSERVER
  BlocOverrides.runZoned(
    () {
      runApp(const App());
    },
    blocObserver: MyBlocObserver(),
  );
}
