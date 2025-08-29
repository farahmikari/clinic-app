part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  final ThemeMode themeMode;
  const ThemeState({required this.themeMode});

  @override
  List<Object> get props => [themeMode];
}

final class ThemeInitial extends ThemeState {
  const ThemeInitial() : super(themeMode: ThemeMode.system);
}

final class ThemeUpdate extends ThemeState {
  const ThemeUpdate({required super.themeMode});
}
