part of 'filter_bloc.dart';

sealed class FilterEvent {}

class FitlersAreSet extends FilterEvent {
  final List<String> filters;

  FitlersAreSet({required this.filters});
}

class FilterIsChanged extends FilterEvent {}

class FilterIsReset extends FilterEvent {}

class FilterWidgetIsActivated extends FilterEvent {}
