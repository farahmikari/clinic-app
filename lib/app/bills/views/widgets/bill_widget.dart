import 'package:clinic_app/app/bill_details/views/screens/bill_details_screen.dart';
import 'package:clinic_app/app/bills/models/bill_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/widgets/filter_badge_widget.dart';
import 'package:clinic_app/core/widgets/vertical_info_with_title_widget.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BillWidget extends StatelessWidget {
  const BillWidget({super.key, required this.bill});
  final BillModel bill;

  @override
  Widget build(BuildContext context) {
    Color specifyStatusColor() {
      return bill.status == S.current.unpaid
          ? Theme.of(context).transparentPrimaryColor
          : Theme.of(context).transparentAccentColor;
    }

    String formatAppointmentDateTimeToDate() {
      return DateFormat(
        'd MMMM y',
      ).format(DateTime.parse(bill.appointmentDateTime));
    }

    String formatAppointmentDateTimeToTime() {
      return DateFormat(
        'h:mm a',
      ).format(DateTime.parse(bill.appointmentDateTime));
    }

    return GestureDetector(
      onTap: () {
        Get.to(
          () => BillDetailsScreen(bill: bill),
          transition: Transition.zoom,
        );
      },
      child: Container(
        padding: EdgeInsets.all(AppDimensions.mp),
        decoration: BoxDecoration(
          color: Theme.of(context).accentBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppDimensions.sp,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalInfoWithTitleWidget(
                  title: S.current.total_amount,
                  info: "${bill.totalPrice} ${bill.currency}",
                  titleSize: AppDimensions.sfs,
                  infoSize: AppDimensions.xlfs,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                BadgeWidget(title: bill.status, color: specifyStatusColor()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppDimensions.sp,
              children: [
                Expanded(
                  child: VerticalInfoWithTitleWidget(
                    title: S.current.doctor,
                    info: bill.doctorName,
                    titleSize: AppDimensions.sfs,
                    infoSize: AppDimensions.mfs,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                Expanded(
                  child: VerticalInfoWithTitleWidget(
                    title: S.current.department,
                    info: bill.department,
                    titleSize: AppDimensions.sfs,
                    infoSize: AppDimensions.mfs,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppDimensions.sp,
              children: [
                Expanded(
                  child: VerticalInfoWithTitleWidget(
                    title: S.current.appointment_date,
                    info: formatAppointmentDateTimeToDate(),
                    titleSize: AppDimensions.sfs,
                    infoSize: AppDimensions.mfs,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                Expanded(
                  child: VerticalInfoWithTitleWidget(
                    title: S.current.appointment_time,
                    info: formatAppointmentDateTimeToTime(),
                    titleSize: AppDimensions.sfs,
                    infoSize: AppDimensions.mfs,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
