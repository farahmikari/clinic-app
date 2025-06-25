import 'package:clinic_app/app/appointments/views/widgets/appointments%20widgets/shimmer_appointment_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/widgets.dart';

class ShimmerAppointmentsWidget extends StatelessWidget {
  const ShimmerAppointmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(AppDimensions.mp),
      itemBuilder: (context, index) {
        return ShimmerAppointmentWidget();
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 2.0.wp);
      },
      itemCount: 5,
    );
  }
}
