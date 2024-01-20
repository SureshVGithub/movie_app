import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/theme/dark_theme.dart';
import 'package:movie_app/src/theme/light_theme.dart';

import '../theme_helper.dart';
part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(lightTheme) {
    //when app is started
    on<InitialThemeSetEvent>((event, emit) async {
      final bool hasDarkTheme = await isDark();
      if (hasDarkTheme) {
        // emit(ThemeData.dark());
        emit(darkTheme);
      } else {
        // emit(ThemeData.light());
        emit(lightTheme);
      }
    });

    //while switch is clicked
    on<ThemeSwitchEvent>((event, emit) {
      final isDark = state == darkTheme;
      emit(isDark ? lightTheme : darkTheme);
      setTheme(isDark);
    });
  }
}
