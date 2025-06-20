part of 'filter_bloc.dart';

sealed class FilterState {
  final String filterName;
  const FilterState(this.filterName);
}

final class FilterInitial extends FilterState {
  FilterInitial(super.filterName);
}

final class UpdateFilterName extends FilterState {
  UpdateFilterName(super.filterName);
}
