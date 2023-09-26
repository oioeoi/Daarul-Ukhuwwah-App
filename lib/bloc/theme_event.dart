part of 'theme_bloc.dart';

sealed class ThemeEvent {}

class ToggleThemeIconEvent extends ThemeEvent {}

class ThemeChange extends ThemeEvent {
  bool isDark = false;
  ThemeChange(this.isDark);
}
