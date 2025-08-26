part of 'localization_bloc.dart';

sealed class LocalizationState extends Equatable {
  final Locale locale;
  final LocalizationMode localizationMode;
  const LocalizationState({
    required this.locale,
    required this.localizationMode,
  });

  @override
  List<Object> get props => [locale, localizationMode];
}

final class LocalizationInitial extends LocalizationState {
  LocalizationInitial()
    : super(locale: Locale('en'), localizationMode: LocalizationMode.system);
}

final class LocalizationUpdate extends LocalizationState {
  const LocalizationUpdate({
    required super.locale,
    required super.localizationMode,
  });
}
