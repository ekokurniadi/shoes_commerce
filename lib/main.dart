import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shamo/application_module.dart';

import 'application.dart';
import 'core/utility/bloc_observer.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  /// ENSURE WIDGETSBINDING IS INITIALIZED
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// DEPENDENCY INJECTION INITIAL
  await di.initials();

  /// APP MODULE INITIAL
  await AppModule().init();

  /// BLOC OBSERVER
  BlocOverrides.runZoned(
    () {
      runApp(const Application());
    },
    blocObserver: MyBlocObserver(),
  );
}
