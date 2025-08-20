part of 'fetch_days_bloc.dart';

sealed class FetchDaysEvent {}

class FetchDefaultDays extends FetchDaysEvent {}

class FetchDepartmentDays extends FetchDaysEvent {
  final int departmentId;
  FetchDepartmentDays({required this.departmentId});
}

class FetchOfferDays extends FetchDaysEvent {
  final int offerId;
  FetchOfferDays({required this.offerId});
}
