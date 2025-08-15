import 'package:clinic_app/core/services/shared_preferences/shared_pereference_service.dart';
import 'package:clinic_app/core/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) async {
      if (event is GetCurrentThemeEvent) {
        final theme = await SharedPereferenceService.getTheme();

        final themeApp =
            theme == 'dark' ? AppTheme.darkTheme : AppTheme.lightTheme;

        emit(LoadedThemeState(themeData: themeApp));
      } else if (event is ChangeThemeEvent) {
        final theme = event.myThemes;

        await SharedPereferenceService.saveTheme(
          theme ==AppTheme.darkTheme?'dark':'light'
        );

        emit(LoadedThemeState(themeData:theme));
      }
    });
  }
}
