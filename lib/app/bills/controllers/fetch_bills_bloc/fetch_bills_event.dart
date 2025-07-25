part of 'fetch_bills_bloc.dart';

sealed class FetchBillsEvent {}

final class FetchBills extends FetchBillsEvent {}

final class DisplayAllBills extends FetchBillsEvent {}

final class DisplayUnpaidBills extends FetchBillsEvent {}

final class DisplayPaidBills extends FetchBillsEvent {}
