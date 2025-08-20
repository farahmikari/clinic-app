import 'package:clinic_app/app/notifications/models/notification_model.dart';
import 'package:clinic_app/app/notifications/views/widgets/notification_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key, required this.notifications});
  final List<NotificationModel> notifications;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(AppDimensions.mp),
      itemBuilder: (context, index) {
        return NotificationWidget(notification: notifications[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: AppDimensions.sp);
      },
      itemCount: notifications.length,
    );
  }
}
