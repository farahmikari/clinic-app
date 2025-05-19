import 'package:clinic_app/app/appointment%20details/views/widgets/main_info_widget.dart';
import 'package:clinic_app/app/appointment%20details/views/widgets/summary%20widgets/department_widget.dart';
import 'package:clinic_app/app/appointment%20details/views/widgets/summary%20widgets/doctor_image_widget.dart';

import 'package:clinic_app/app/appointment%20details/views/widgets/summary%20widgets/doctor_name_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/secondary_info_widget.dart';
import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0.hp,
      margin: EdgeInsets.all(AppDimensions.mm),
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: Column(
        children: [
          Expanded(
            //----------------------Doctor Image------------------------------------------------------------------------------------------------------------------------
            child: DoctorImageWidget(),
          ),
          Expanded(
            child: Column(
              children: [
                //-------------------Doctor Name-------------------------------------------------------------------------------------------------------------------------
                DoctorNameWidget(),
                //--------------------Department-------------------------------------------------------------------------------------------------------------------------
                DepartmentWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //-----------Appointment Date-----------------------------------------------------------------------------------------------------------------------
                    MainInfoWidget(
                      title: "17 May, 2025",
                      icon: AppIcons.calendar,
                    ),
                    //-----------Appointment Time-----------------------------------------------------------------------------------------------------------------------
                    MainInfoWidget(title: "09:30 AM", icon: AppIcons.time),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(AppDimensions.mp),
                    child: Row(
                      children: [
                        //------------Request Type--------------------------------------------------------------------------------------------------------------------------
                        SecondaryInfoWidget(
                          title: "With Report",
                          icon: AppIcons.medicalReport,
                        ),
                        SizedBox(width: AppDimensions.mm),
                        //-----With or Without Medical Report----------------------------------------------------------------------------------------------------------------
                        SecondaryInfoWidget(
                          title: "Check-Up",
                          icon: AppIcons.requestType,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
