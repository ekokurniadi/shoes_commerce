part of 'theme_controller_cubit.dart';

abstract class ThemeControllerState extends Equatable {
  const ThemeControllerState();

  @override
  List<Object> get props => [];
}

class ThemeControllerInitial extends ThemeControllerState {}

class ThemeControllerOnLightMode extends ThemeControllerState {}

class ThemeControllerOnDarkMode extends ThemeControllerState {}
