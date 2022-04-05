import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo/core/core.dart';
import 'package:shamo/injection_container.dart';

part 'theme_controller_state.dart';

class ThemeControllerCubit extends Cubit<ThemeControllerState> {
  ThemeControllerCubit() : super(ThemeControllerInitial());
  final SharedPreferencesHelper _sharedPreferencesHelper =
      sl<SharedPreferencesHelper>();

  Future<void> checkCurrentThemeMode() async {
    final String? currentTheme =
        await _sharedPreferencesHelper.getThemeToPreferences();

    switch (currentTheme) {
      case ConstantHelper.THEME_DARK:
        {
          await _sharedPreferencesHelper
              .setThemeToPreferences(ConstantHelper.THEME_DARK);
          emit(ThemeControllerOnDarkMode());
        }
        break;
      case ConstantHelper.THEME_LIGHT:
        {
          await _sharedPreferencesHelper
              .setThemeToPreferences(ConstantHelper.THEME_LIGHT);
          emit(ThemeControllerOnLightMode());
        }
        break;
      default:
        {
          await _sharedPreferencesHelper
              .setThemeToPreferences(ConstantHelper.THEME_DARK);
          emit(ThemeControllerOnDarkMode());
        }
    }
  }

  Future<void> changeThemeMode() async {
    if (state is ThemeControllerOnLightMode) {
      emit(ThemeControllerOnDarkMode());
    } else if (state is ThemeControllerOnDarkMode) {
      emit(ThemeControllerOnLightMode());
    }
  }
}
