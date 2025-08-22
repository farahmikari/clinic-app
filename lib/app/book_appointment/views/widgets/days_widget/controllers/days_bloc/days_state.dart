part of 'days_bloc.dart';

sealed class DaysState extends Equatable {
  const DaysState({
    required this.currentDepartmentId,
    required this.currentDay,
    required this.previousDay,
    required this.previousTimeId,
    required this.isDaysWidgetActivated,
  });

  final int currentDepartmentId;
  final String currentDay;
  final String previousDay;
  final int previousTimeId;
  final bool isDaysWidgetActivated;

  @override
  List<Object> get props => [
    currentDepartmentId,
    currentDay,
    previousDay,
    previousTimeId,
    isDaysWidgetActivated,
  ];
}

final class DaysInitial extends DaysState {
  const DaysInitial()
    : super(
        currentDepartmentId: -1,
        currentDay: "",
        previousDay: "",
        previousTimeId: -1,
        isDaysWidgetActivated: false,
      );
}

final class DaysUpdated extends DaysState {
  const DaysUpdated({
    required super.currentDepartmentId,
    required super.currentDay,
    required super.previousDay,
    required super.previousTimeId,
    required super.isDaysWidgetActivated,
  });
}
