part of 'filter_bloc.dart';

sealed class FilterState extends Equatable {
  final String filterName;
  final bool isFilterWidgetActivated;

  const FilterState({
    required this.filterName,
    required this.isFilterWidgetActivated,
  });

  @override
  List<Object?> get props => [filterName, isFilterWidgetActivated];
}

final class FilterInitial extends FilterState {
  const FilterInitial()
    : super(filterName: "All", isFilterWidgetActivated: false);
}

final class UpdateFilterName extends FilterState {
  const UpdateFilterName({
    required super.filterName,
    required super.isFilterWidgetActivated,
  });
}
