part of 'bottom_navigation_bar_bloc.dart';

sealed class BottomNavigationBarEvent extends Equatable {
  const BottomNavigationBarEvent(this.currentIndex);

  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];
}

class CurrentIndexChanged extends BottomNavigationBarEvent {
  const CurrentIndexChanged(super.currentIndex);
}
