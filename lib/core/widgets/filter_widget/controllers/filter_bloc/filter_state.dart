part of 'filter_bloc.dart';

sealed class FilterState extends Equatable {
  final int filterIndex;
  final bool isFilterWidgetActivated;

  const FilterState({
    required this.filterIndex,
    required this.isFilterWidgetActivated,
  });

  @override
  List<Object?> get props => [filterIndex, isFilterWidgetActivated];
}

final class FilterInitial extends FilterState {
  const FilterInitial() : super(filterIndex: 0, isFilterWidgetActivated: false);
}

final class FilterUpdate extends FilterState {
  const FilterUpdate({
    required super.filterIndex,
    required super.isFilterWidgetActivated,
  });
}
