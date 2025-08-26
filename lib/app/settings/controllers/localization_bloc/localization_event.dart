part of 'localization_bloc.dart';

sealed class LocalizationEvent {}

final class LocalizationModeIsChanged extends LocalizationEvent {
  final LocalizationMode localizationMode;
  LocalizationModeIsChanged({required this.localizationMode});
}

final class SavedLocalizationModeIsFetched extends LocalizationEvent {}
