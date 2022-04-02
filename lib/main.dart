import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  BlocOverrides.runZoned(
    () {
      runApp(const App());
    },
    blocObserver: MyBlocObserver(),
  );
}
