part of 'fetch_bill_details_bloc.dart';

sealed class FetchBillDetailsState {}

final class FetchBillDetailsLoading extends FetchBillDetailsState {}

final class FetchBillDetailsLoaded extends FetchBillDetailsState {
  final List<BillInfoModel> billInfo;

  FetchBillDetailsLoaded({required this.billInfo});
}

final class FetchBillDetailsFailed extends FetchBillDetailsState {
  final String errorMessage;

  FetchBillDetailsFailed({required this.errorMessage});
}
