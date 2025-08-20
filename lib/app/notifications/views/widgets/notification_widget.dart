import 'package:clinic_app/app/notifications/models/notification_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key, required this.notification});
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    String formatNotificationDate() {
      return DateFormat('d MMMM, yyyy').format(notification.createdAt);
    }

    String specifyIcon() {
      switch (notification.type) {
        case "reminder":
          return AppIcons.calendar;
        case "prescription":
          return AppIcons.prescriptions;
        case "report":
          return AppIcons.medicalReport;
        default:
          return AppIcons.notifications;
      }
    }

    Color specifyBackgroundColor() {
      return notification.isRead
          ? AppColors.widgetBackgroundColor
          : AppColors.lightBlueColor;
    }

    Color specifyIconBackgroundColor() {
      switch (notification.type) {
        case "reminder":
          return AppColors.primaryColor;
        case "prescription":
          return AppColors.accentColor;
        case "report":
          return AppColors.darkBlueColor;
        default:
          return AppColors.primaryColor;
      }
    }

    return Container(
      padding: EdgeInsets.all(AppDimensions.mp),
      decoration: BoxDecoration(
        color: specifyBackgroundColor(),
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        image: DecorationImage(
          image: AssetImage("assets/images/watermark7.png"),
          fit: BoxFit.cover,
        ),
        boxShadow: AppShadow.boxShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AppDimensions.mp,
        children: [
          Container(
            width: 14.0.wp,
            height: 14.0.wp,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: specifyIconBackgroundColor(),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              specifyIcon(),
              height: AppDimensions.mis,
              width: AppDimensions.mis,
              color: AppColors.widgetBackgroundColor,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppDimensions.sp,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      notification.title,
                      style: TextStyle(
                        color: AppColors.darkGreyColor,
                        fontSize: AppDimensions.sfs,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      formatNotificationDate(),
                      style: TextStyle(
                        color: AppColors.hintTextColor,
                        fontSize: AppDimensions.sfs,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  notification.body,
                  style: TextStyle(
                    color: AppColors.mainTextColor,
                    fontSize: AppDimensions.sfs,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
