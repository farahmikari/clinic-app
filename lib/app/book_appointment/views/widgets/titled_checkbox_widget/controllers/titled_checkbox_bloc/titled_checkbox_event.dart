part of 'titled_checkbox_bloc.dart';

sealed class TitledCheckboxEvent {
  const TitledCheckboxEvent();
}

class IsCurrentCheckedIsToggled extends TitledCheckboxEvent {}

class IsTitledCheckboxWidgetActivatedIsToggled extends TitledCheckboxEvent {}

class CurrentAndPreviousCheckAreSet extends TitledCheckboxEvent {
  final bool currentAndPreviousCheck;

  CurrentAndPreviousCheckAreSet({required this.currentAndPreviousCheck});
}

class TitledCheckboxWidgetIsReset extends TitledCheckboxEvent {}
