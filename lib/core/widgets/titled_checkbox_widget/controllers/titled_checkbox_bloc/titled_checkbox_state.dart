part of 'titled_checkbox_bloc.dart';

sealed class TitledCheckboxState {
  const TitledCheckboxState({
    required this.isPreviousChecked,
    required this.isCurrentChecked,
    required this.isTitledCheckboxWidgetActived,
  });

  final bool isPreviousChecked;
  final bool isCurrentChecked;
  final bool isTitledCheckboxWidgetActived;
}

final class TitledCheckboxInitial extends TitledCheckboxState {
  const TitledCheckboxInitial()
    : super(
        isPreviousChecked: false,
        isCurrentChecked: false,
        isTitledCheckboxWidgetActived: false,
      );
}

final class TitledCheckboxUpdated extends TitledCheckboxState {
  const TitledCheckboxUpdated({
    required super.isPreviousChecked,
    required super.isCurrentChecked,
    required super.isTitledCheckboxWidgetActived,
  });
}
