import 'package:clinic_app/app/bill_details/views/screens/bill_details_screen.dart';
import 'package:clinic_app/app/bills/models/bill_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/widgets/filter_badge_widget.dart';
import 'package:clinic_app/core/widgets/vertical_info_with_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BillWidget extends StatelessWidget {
  const BillWidget({super.key, required this.bill});
  final BillModel bill;

  Color specifyStatusColor() {
    return bill.status == "Unpaid"
        ? AppColors.transparentGreen
        : AppColors.transparentYellow;
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => BillDetailsScreen(bill: bill),
          transition: Transition.zoom,
        );
      },
      borderRadius: BorderRadius.circular(AppDimensions.mbr),
      child: Container(
        padding: EdgeInsets.all(AppDimensions.mp),
        decoration: BoxDecoration(
          color: AppColors.widgetBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalInfoWithTitleWidget(
                  title: "Total Amount",
                  info: "${bill.totalPrice} ${bill.currency}",
                  titleSize: AppDimensions.sfs,
                  infoSize: AppDimensions.xlfs,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                FilterBadgeWidget(
                  badge: bill.status,
                  color: specifyStatusColor(),
                ),
              ],
            ),
            SizedBox(height: AppDimensions.mp),
            Row(
              children: [
                Expanded(
                  child: VerticalInfoWithTitleWidget(
                    title: "Doctor",
                    info: bill.doctorName,
                    titleSize: AppDimensions.sfs,
                    infoSize: AppDimensions.mfs,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                SizedBox(width: AppDimensions.sp),
                Expanded(
                  child: VerticalInfoWithTitleWidget(
                    title: "Department",
                    info: bill.department,
                    titleSize: AppDimensions.sfs,
                    infoSize: AppDimensions.mfs,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimensions.sp),
            Row(
              children: [
                Expanded(
                  child: VerticalInfoWithTitleWidget(
                    title: "Appointment Date",
                    info: formatAppointmentDateTimeToDate(),
                    titleSize: AppDimensions.sfs,
                    infoSize: AppDimensions.mfs,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                SizedBox(width: AppDimensions.sp),
                Expanded(
                  child: VerticalInfoWithTitleWidget(
                    title: "Appointment Time",
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
