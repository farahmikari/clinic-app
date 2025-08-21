part of 'localization_bloc.dart';

sealed class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

final class LocaleIsChanged extends LocalizationEvent {
  final Locale locale;
  const LocaleIsChanged({required this.locale});
}

final class SavedLocaleIsFetched extends LocalizationEvent {}
