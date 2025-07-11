import 'package:clinic_app/app/appointment_details/models/completed_appointment_models/medication_model.dart';
import 'package:clinic_app/app/appointment_details/views/widgets/main_info_widget.dart';
import 'package:clinic_app/app/appointment_details/views/widgets/medications_widgets/medication_name_widget.dart';
import 'package:clinic_app/app/appointment_details/views/widgets/medications_widgets/medication_note_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:flutter/material.dart';

class MedicationWidget extends StatelessWidget {
  const MedicationWidget({super.key, required this.medication});
  final MedicationModel medication;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0.wp,
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: Column(
        children: [
          //-----------------------Medication Name------------------------------------------------------------------------------------------------------------------------------
          Expanded(flex: 1, child: MedicationNameWidget(name: medication.name)),
          //---------------------Main Medication Info------------------------------------------------------------------------------------------------------------------------------
          Expanded(
            flex: 2,
            child: GridView(
              padding: EdgeInsets.all(AppDimensions.mp),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppDimensions.sm,
                mainAxisSpacing: AppDimensions.sm,
                mainAxisExtent: 3.0.hp,
              ),
              children: [
                //---------------------Medication Type--------------------------------------------------------------------------------------------
                MainInfoWidget(
                  title: medication.type,
                  icon: AppIcons.medicationType,
                ),

                //--------------------Medication Dosage--------------------------------------------------------------------------------------------
                MainInfoWidget(
                  title: medication.dosage,
                  icon: AppIcons.medicationDosage,
                ),
                //-------------------Medication Frequency--------------------------------------------------------------------------------------------
                MainInfoWidget(
                  title: medication.frequency,
                  icon: AppIcons.medicationFrequency,
                ),
                //--------------------Medication Duration--------------------------------------------------------------------------------------------
                MainInfoWidget(
                  title: medication.duration,
                  icon: AppIcons.calendar,
                ),
              ],
            ),
          ),
          //---------------------------Medication Note--------------------------------------------------------------------------------------------
          Expanded(flex: 2, child: MedicationNoteWidget(note: medication.note)),
        ],
      ),
    );
  }
}
