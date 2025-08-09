part of 'fetch_notifications_bloc.dart';

sealed class FetchNotificationsState {}

final class FetchNotificationsLoading extends FetchNotificationsState {}

final class FetchNotificationsLoaded extends FetchNotificationsState {
  final List<NotificationModel> notifications;
  FetchNotificationsLoaded({required this.notifications});
}

final class FetchNotificationsFailed extends FetchNotificationsState {
  final String errorMessage;
  FetchNotificationsFailed({required this.errorMessage});
}
