import 'package:clinic_app/app/notifications/models/json_model.dart';
import 'package:clinic_app/app/notifications/models/notification_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_notifications_event.dart';
part 'fetch_notifications_state.dart';

class FetchNotificationsBloc
    extends Bloc<FetchNotificationsEvent, FetchNotificationsState> {
  FetchNotificationsBloc() : super(FetchNotificationsLoading()) {
    //DioConsumer api = DioConsumer(dio: Dio());
    List<NotificationModel> unreadNotifications = [];
    List<NotificationModel> readNotifications = [];
    List<NotificationModel> allNotifications = [];
    on<FetchNotifications>((event, emit) async {
      await Future.delayed(Duration(seconds: 3));
      try {
        unreadNotifications =
            myUnreadNotifications
                .map((notification) => NotificationModel.fromJson(notification))
                .toList();
        readNotifications =
            myReadNotifications
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
