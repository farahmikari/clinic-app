import 'package:clinic_app/app/notifications/models/notification_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_notifications_event.dart';
part 'fetch_notifications_state.dart';

class FetchNotificationsBloc
    extends Bloc<FetchNotificationsEvent, FetchNotificationsState> {
  FetchNotificationsBloc() : super(FetchNotificationsLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());
    List<NotificationModel> unreadNotifications = [];
    List<NotificationModel> readNotifications = [];
    List<NotificationModel> allNotifications = [];
    on<FetchNotifications>((event, emit) async {
      emit(FetchNotificationsLoading());
      try {
        final response = await api.get(EndPoints.notifications);
        unreadNotifications =
            (response[ApiKey.unreadNotifications] as List<dynamic>)
                .map((notification) => NotificationModel.fromJson(notification))
                .toList();
        readNotifications =
            (response[ApiKey.readNotifications] as List<dynamic>)
                .map((notification) => NotificationModel.fromJson(notification))
                .toList();
        allNotifications = [...unreadNotifications, ...readNotifications];
        emit(FetchNotificationsLoaded(notifications: allNotifications));
      } catch (e) {
        emit(FetchNotificationsFailed(errorMessage: e.toString()));
      }
    });
  }
}
