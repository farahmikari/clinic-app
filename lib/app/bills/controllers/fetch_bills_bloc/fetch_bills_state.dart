part of 'fetch_bills_bloc.dart';

sealed class FetchBillsState {}

final class FetchBillsLoading extends FetchBillsState {}

final class FetchBillsLoaded extends FetchBillsState {
  final List<BillModel> bills;

  FetchBillsLoaded({required this.bills});
}

final class FetchBillsLoadedEmpty extends FetchBillsState {}

final class FetchBillsFailed extends FetchBillsState {
  final String errorMessage;

  FetchBillsFailed({required this.errorMessage});
}
