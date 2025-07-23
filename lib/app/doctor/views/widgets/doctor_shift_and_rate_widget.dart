import 'package:clinic_app/app/doctor/views/widgets/doctor_info_with_icon_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DoctorShiftAndRateWidget extends StatelessWidget {
  const DoctorShiftAndRateWidget({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.rate,
  });

  final DateTime startTime;
  final DateTime endTime;
  final num rate;

  @override
  Widget build(BuildContext context) {
    String formatDateToTime(DateTime time) {
      return DateFormat('hh:mm a').format(time);
    }

    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
        child: Row(
          children: [
            //----------------------|Doctor Shift|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
            DoctorInfoWithIconWidget(
              icon: AppIcons.time,
              info:
                  "${formatDateToTime(startTime)}  -  ${formatDateToTime(endTime)}",
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            //-----------------------|Doctor Rate|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
            DoctorInfoWithIconWidget(
              icon: AppIcons.rate,
              info: rate.toString(),
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ],
        ),
      ),
    );
  }
}
