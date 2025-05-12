import 'package:clinic_app/app/book%20feature/models/time_model.dart';
import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/widgets.dart';

class DefaultTimesWidget extends StatelessWidget {
  final List<TimeModel> times;
  const DefaultTimesWidget({super.key, required this.times});

  @override
  Widget build(BuildContext context) {
    List<BoxShadow> boxShadow = [
      const BoxShadow(
        color: Color(0x1A000000),
        spreadRadius: 2,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ];
    return GridView.builder(
      padding: EdgeInsets.all(4.0.wp),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0.wp,
        mainAxisSpacing: 2.0.wp,
        mainAxisExtent: 6.0.hp,
      ),
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.widgetBackgroundColor,
            borderRadius: BorderRadius.circular(15.0.sp),
            boxShadow: boxShadow,
          ),
          child: Text(
            times[index].name,
            style: TextStyle(
              color: AppColors.hintTextColor,
              fontSize: 12.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
      itemCount: 6,
    );
  }
}
