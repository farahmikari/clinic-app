part of 'fetch_bill_details_bloc.dart';

sealed class FetchBillDetailsEvent {}

final class FetchBillDetails extends FetchBillDetailsEvent {
  final int billId;

  FetchBillDetails({required this.billId});
}
