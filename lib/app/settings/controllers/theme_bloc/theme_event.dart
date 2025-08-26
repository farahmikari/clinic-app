part of 'theme_bloc.dart';

sealed class ThemeEvent {}

final class ThemeModeIsChanged extends ThemeEvent {
  final ThemeMode themeMode;

  ThemeModeIsChanged({required this.themeMode});
}

final class SavedThemeModeIsFetched extends ThemeEvent {}
