part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState({required this.searchWord});
  final String searchWord;

  @override
  List<Object> get props => [searchWord];
}

final class SearchInitial extends SearchState {
  const SearchInitial() : super(searchWord: "");
}

final class SearchUpdate extends SearchState {
  const SearchUpdate({required super.searchWord});
}
