import 'package:clinic_app/app/appointments/views/widgets/appointments_widgets/shimmer_appointment_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAppointmentsWidget extends StatelessWidget {
  const ShimmerAppointmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: ListView.separated(
        padding: EdgeInsets.all(AppDimensions.mp),
        itemBuilder: (context, index) {
          return ShimmerAppointmentWidget();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: AppDimensions.sp);
        },
        itemCount: 10,
      ),
    );
  }
}
