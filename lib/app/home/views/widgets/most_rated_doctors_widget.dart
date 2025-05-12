import 'package:clinic_app/app/doctor/views/screens/doctor_profile_screen.dart';
import 'package:clinic_app/app/home/models/most_rated_doctor_model.dart';
import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MostRatedDoctorsWidget extends StatelessWidget {
  final List<MostRatedDoctorModel> mostRatedDoctors;
  const MostRatedDoctorsWidget({super.key, required this.mostRatedDoctors});

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
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          width: 40.0.wp,
          color: Colors.transparent,
          child: Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(15.0.sp),
                onTap: () {
                  Get.to(
                    () => DoctorProfileScreen(id: mostRatedDoctors[index].id),
                  );
                },
                child: Container(
                  height: 20.0.hp,
                  padding: EdgeInsets.only(top: 2.0.wp),
                  decoration: BoxDecoration(
                    color: AppColors.widgetBackgroundColor,
                    borderRadius: BorderRadius.circular(15.0.sp),
                    boxShadow: boxShadow,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image(
                          image: NetworkImage(mostRatedDoctors[index].image),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Container(
                          height: 5.0.hp,
                          padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.0.sp),
                            ),
                          ),
                          child: Text(
                            mostRatedDoctors[index].specialty,
                            style: TextStyle(
                              color: AppColors.widgetBackgroundColor,
                              fontSize: 10.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Dr.${mostRatedDoctors[index].name}",
                    style: TextStyle(
                      color: AppColors.mainTextColor,
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Icon(
                          Icons.star_rounded,
                          color: AppColors.primaryColor,
                          size: 20.0.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          mostRatedDoctors[index].rate.toString(),
                          style: TextStyle(
                            color: AppColors.darkGreyColor,
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Text(
                          "(${mostRatedDoctors[index].treatments} treatment)",
                          style: TextStyle(
                            color: AppColors.hintTextColor,
                            fontSize: 8.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 2.0.wp);
      },
      itemCount: mostRatedDoctors.length,
    );
  }
}
