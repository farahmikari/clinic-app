part of 'filter_bloc.dart';

sealed class FilterEvent {}

class FilterIsChanged extends FilterEvent {}

class FilterIsReset extends FilterEvent {}

class FilterWidgetIsActivated extends FilterEvent {}
