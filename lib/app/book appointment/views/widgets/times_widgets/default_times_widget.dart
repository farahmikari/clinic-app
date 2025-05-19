import 'package:clinic_app/app/book%20appointment/models/time_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/widgets.dart';

class DefaultTimesWidget extends StatelessWidget {
  const DefaultTimesWidget({super.key, required this.times});

  final List<TimeModel> times;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(AppDimensions.mp),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppDimensions.sm,
        mainAxisSpacing: AppDimensions.sm,
        mainAxisExtent: 6.0.hp,
      ),
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.widgetBackgroundColor,
            borderRadius: BorderRadius.circular(AppDimensions.mbr),
            boxShadow: AppShadow.boxShadow,
          ),
          child: Text(
            times[index].name,
            style: TextStyle(
              color: AppColors.hintTextColor,
              fontSize: AppDimensions.mfs,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
      itemCount: 6,
    );
  }
}
