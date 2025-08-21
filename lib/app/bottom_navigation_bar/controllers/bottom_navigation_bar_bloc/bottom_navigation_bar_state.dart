part of 'bottom_navigation_bar_bloc.dart';

sealed class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState({
    required this.currentIndex,
    required this.isHomeBlocsInitialized,
    required this.isAppointmentsBlocsInitialized,
    required this.isDepartmentsBlocsInitialized,
    required this.isBillsBlocsInitialized,
  });

  final int currentIndex;
  final bool isHomeBlocsInitialized;
  final bool isAppointmentsBlocsInitialized;
  final bool isDepartmentsBlocsInitialized;
  final bool isBillsBlocsInitialized;

  @override
  List<Object> get props => [currentIndex];
}

final class BottomNavigationBarInitial extends BottomNavigationBarState {
  const BottomNavigationBarInitial()
    : super(
        currentIndex: 0,
        isHomeBlocsInitialized: false,
        isAppointmentsBlocsInitialized: false,
        isDepartmentsBlocsInitialized: false,
        isBillsBlocsInitialized: false,
      );
}

final class BottomNavigationBarUpdate extends BottomNavigationBarState {
  const BottomNavigationBarUpdate({
    required super.currentIndex,
    required super.isHomeBlocsInitialized,
    required super.isAppointmentsBlocsInitialized,
    required super.isBillsBlocsInitialized,
    required super.isDepartmentsBlocsInitialized,
  });
}
