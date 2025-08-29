part of 'search_bloc.dart';

sealed class SearchEvent {}

final class SearchWordIsUpdated extends SearchEvent {
  final String searchWord;

  SearchWordIsUpdated({required this.searchWord});
}
