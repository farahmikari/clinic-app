part of 'bottom_navigation_bar_bloc.dart';

sealed class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState({
    required this.currentIndex,
    required this.isDataFetched,
  });

  final int currentIndex;
  final List<bool> isDataFetched;

  @override
  List<Object> get props => [currentIndex];
}

final class BottomNavigationBarInitial extends BottomNavigationBarState {
  BottomNavigationBarInitial()
    : super(currentIndex: 0, isDataFetched: [false, false, false, false]);
}

final class UpdateBottomNavigationBar extends BottomNavigationBarState {
  const UpdateBottomNavigationBar({
    required super.currentIndex,
    required super.isDataFetched,
  });
}
