part of 'localization_bloc.dart';

sealed class LocalizationState extends Equatable {
  final Locale locale;
  const LocalizationState({required this.locale});

  @override
  List<Object> get props => [locale];
}

final class LocalizationInitial extends LocalizationState {
  LocalizationInitial() : super(locale: Locale('en'));
}

final class LocalizationUpdate extends LocalizationState {
  const LocalizationUpdate({required super.locale});
}
