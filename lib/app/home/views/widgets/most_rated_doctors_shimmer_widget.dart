import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MostRatedDoctorsShimmerWidget extends StatelessWidget {
  const MostRatedDoctorsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          width: 40.0.wp,
          color: Colors.transparent,
          child: Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 20.0.hp,
                  padding: EdgeInsets.only(top: 2.0.wp),
                  decoration: BoxDecoration(
                    color: AppColors.widgetBackgroundColor,
                    borderRadius: BorderRadius.circular(15.0.sp),
                  ),
                ),
              ),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    margin: EdgeInsets.only(top: 4.0.wp, right: 14.0.wp),
                    decoration: BoxDecoration(
                      color: AppColors.widgetBackgroundColor,
                      borderRadius: BorderRadius.circular(15.0.sp),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    margin: EdgeInsets.only(top: 4.0.wp),
                    decoration: BoxDecoration(
                      color: AppColors.widgetBackgroundColor,
                      borderRadius: BorderRadius.circular(15.0.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 2.0.wp);
      },
      itemCount: 5,
    );
  }
}
