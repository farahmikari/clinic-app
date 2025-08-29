part of 'filter_bloc.dart';

sealed class FilterEvent {}

class FilterIsChanged extends FilterEvent {}

class FilterWidgetIsDeactivated extends FilterEvent {}

class FilterWidgetIsActivated extends FilterEvent {}
