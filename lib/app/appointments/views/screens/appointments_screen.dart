import 'package:clinic_app/app/appointments/views/widgets/appointment_widget.dart';
import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

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
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        title: Text(
          "Appointments",
          style: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: 16.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0.hp),
          child: Padding(
            padding: EdgeInsets.only(
              left: 4.0.wp,
              right: 4.0.wp,
              bottom: 4.0.wp,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: boxShadow,
                    ),
                    child: TextFormField(
                      style: TextStyle(
                        color: AppColors.mainTextColor,
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.widgetBackgroundColor,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.darkGreyColor,
                          size: 20.0.sp,
                        ),
                        hintText: "Doctor, Date, Department...",
                        hintStyle: TextStyle(
                          color: AppColors.hintTextColor,
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      cursorColor: AppColors.mainTextColor,
                      autocorrect: false,
                    ),
                  ),
                ),
                SizedBox(width: 2.0.wp),
                Container(
                  height: 7.0.hp,
                  width: 7.0.hp,
                  decoration: BoxDecoration(
                    color: AppColors.widgetBackgroundColor,
                    shape: BoxShape.circle,
                    boxShadow: boxShadow,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.tune,
                      color: AppColors.hintTextColor,
                      size: 20.0.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(4.0.wp),
        itemBuilder: (context, index) {
          return AppointmentWidget();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 2.0.wp);
        },
        itemCount: 7,
      ),
    );
  }
}
