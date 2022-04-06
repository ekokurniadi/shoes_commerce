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
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await di.initials();
  DioHelper.initDio(ConstantHelper.BASE_URL);
  DioHelper.setDioInterceptor(ConstantHelper.BASE_URL);

  if (!kReleaseMode) {
    FlipperClient flipperClient = FlipperClient.getDefault();
    flipperClient.addPlugin(FlipperNetworkPlugin());
    flipperClient.addPlugin(FlipperSharedPreferencesPlugin());
    flipperClient.start();
  }

  BlocOverrides.runZoned(
    () {
      runApp(const App());
    },
    blocObserver: MyBlocObserver(),
  );
}
