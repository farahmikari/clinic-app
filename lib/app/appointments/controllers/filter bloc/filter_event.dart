part of 'filter_bloc.dart';

sealed class FilterEvent {
  const FilterEvent();
}

class FilterChanged extends FilterEvent {}

class FilterChangedToAll extends FilterEvent {}
