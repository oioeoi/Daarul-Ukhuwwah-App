part of 'theme_bloc.dart';

sealed class ThemeEvent {}

class ToggleThemeIconEvent extends ThemeEvent {}

class ThemeChange extends ThemeEvent {
  bool isDarkTheme = false;
  ThemeChange(this.isDarkTheme);
}
