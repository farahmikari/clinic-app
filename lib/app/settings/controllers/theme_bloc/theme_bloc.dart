import 'package:clinic_app/core/services/shared_preferences/shared_pereference_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeModeIsChanged>((event, emit) {
      if (event.themeMode == state.themeMode) return;
      SharedPreferencesService.saveThemeMode(event.themeMode);
      emit(ThemeUpdate(themeMode: event.themeMode));
    });

    on<SavedThemeModeIsFetched>((event, emit) async {
      ThemeMode savedThemeMode = await SharedPreferencesService.getThemeMode();
      emit(ThemeUpdate(themeMode: savedThemeMode));
    });
  }
}
