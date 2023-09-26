import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.light) {
    on<ThemeChange>((event, emit) {
      final _isDark = event.isDark;
      emit(_isDark ? ThemeMode.dark : ThemeMode.light);
    });

    on<ToggleThemeIconEvent>((event, emit) {
      emit(isDark);
    });
  }
  ThemeMode get isDark => isDark;
}
