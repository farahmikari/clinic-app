part of 'localization_bloc.dart';

sealed class LocalizationEvent {}

final class LocaleIsChanged extends LocalizationEvent {
  final Locale locale;
  LocaleIsChanged({required this.locale});
}

final class SavedLocaleIsFetched extends LocalizationEvent {}
