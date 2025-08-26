import 'package:clinic_app/app/notifications/controllers/fetch_notifications_bloc/fetch_notifications_bloc.dart';
import 'package:clinic_app/app/notifications/views/widgets/notifications_widget.dart';
import 'package:clinic_app/app/notifications/views/widgets/shimmer_notifications_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/widgets/empty_list_widget.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    context.read<FetchNotificationsBloc>().add(FetchNotifications());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchNotificationsBloc()..add(FetchNotifications()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.current.notifications,
            style: TextStyle(
              color: Theme.of(context).primaryTextColor,
              fontSize: AppDimensions.lfs,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Builder(
          builder: (context) {
            return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              color: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).accentBackgroundColor,
              child: BlocBuilder<
                FetchNotificationsBloc,
                FetchNotificationsState
              >(
                builder: (context, state) {
                  if (state is FetchNotificationsLoaded) {
                    return NotificationsWidget(
                      notifications: state.notifications,
                    );
                  }
                  if (state is FetchNotificationsLoadedEmpty) {
                    return EmptyListWidget(
                      image: "assets/images/empty_notifications.png",
                      title: "No Notifications Yet",
                      subtitle:
                          "You haven’t received any notifications so far. Stay tuned for updates!",
                    );
                  }
                  return ShimmerNotificationsWidget();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
