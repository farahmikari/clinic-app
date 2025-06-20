import 'package:clinic_app/app/doctor/views/widgets/doctor_info_with_icon_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:flutter/material.dart';

class DoctorShiftAndRateWidget extends StatelessWidget {
  const DoctorShiftAndRateWidget({
    super.key,
    required this.startHour,
    required this.endHour,
    required this.rate,
  });

  final String startHour;
  final String endHour;
  final num rate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
        child: Row(
          children: [
            //----------------------|Doctor Shift|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
            DoctorInfoWithIconWidget(
              icon: AppIcons.time,
              info: "$startHour am  -  $endHour pm",
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
