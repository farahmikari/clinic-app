part of 'fetch_bill_details_bloc.dart';

sealed class FetchBillDetailsEvent {}

final class FetchBillDetails extends FetchBillDetailsEvent {
  final BillModel bill;

  FetchBillDetails({required this.bill});
}
