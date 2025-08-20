import 'package:clinic_app/app/notifications/controllers/fetch_notifications_bloc/fetch_notifications_bloc.dart';
import 'package:clinic_app/app/notifications/views/widgets/notifications_widget.dart';
import 'package:clinic_app/app/notifications/views/widgets/shimmer_notifications_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => FetchNotificationsBloc()..add(FetchNotifications()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: AppColors.backgroundColor,
          title: Text(
            "Notifications",
            style: TextStyle(
              fontSize: AppDimensions.lfs,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<FetchNotificationsBloc, FetchNotificationsState>(
            builder: (context, state) {
              if (state is FetchNotificationsLoaded) {
                return NotificationsWidget(notifications: state.notifications);
              }
              return ShimmerNotificationsWidget();
            },
          ),
        ),
      ),
    );
  }
}
