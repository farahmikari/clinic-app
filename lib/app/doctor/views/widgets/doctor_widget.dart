import 'package:clinic_app/app/doctor/models/doctor_model.dart';
import 'package:clinic_app/app/doctor/views/widgets/book_appointment_button_widget.dart';
import 'package:clinic_app/app/doctor/views/widgets/doctor_bio_widget.dart';
import 'package:clinic_app/app/doctor/views/widgets/doctor_experience_and_treatments_widget.dart';
import 'package:clinic_app/app/doctor/views/widgets/doctor_image_widget.dart';
import 'package:clinic_app/app/doctor/views/widgets/doctor_name_and_specialty_widget.dart';
import 'package:clinic_app/app/doctor/views/widgets/doctor_qualifications_widget.dart';
import 'package:clinic_app/app/doctor/views/widgets/doctor_shift_and_rate_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorWidget extends StatelessWidget {
  const DoctorWidget({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //--------------------|Doctor Image|-------------------------------------------------------------------------------------------------------------------------------------------
        DoctorImageWidget(image: doctor.image),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //---------|Doctor Name & Specialty|--------------------------------------------------------------------------------------------------------------------------------------
              DoctorNameAndSpecialtyWidget(
                name: doctor.name,
                specialty: doctor.specialty,
              ),
              //-----------|Doctor Shift & Rate|----------------------------------------------------------------------------------------------------------------------------------------
              DoctorShiftAndRateWidget(
                startTime: doctor.startTime,
                endTime: doctor.endTime,
                rate: doctor.rate,
              ),
              //-------|Doctor Eperience & Treatments|-----------------------------------------------------------------------------------------------------------------------------------
              DoctorExperienceAndTreatmentsWidget(
                experience: doctor.experience,
                treatments: doctor.treatments,
              ),
              //--------------|Doctor Bio|----------------------------------------------------------------------------------------------------------------------------------------------
              DoctorBioWidget(bio: doctor.bio),
              //--------|Qualifications Subtitle|----------------------------------------------------------------------------------------------------------------------------------------
              SubtitleWidget(subtitle: "Qualifications"),
              //---------|Doctor Qualifications|-----------------------------------------------------------------------------------------------------------------------------------------
              DoctorQualificationsWidget(qualifications: doctor.qualifications),
              //--------|Book Appointment Button|----------------------------------------------------------------------------------------------------------------------------------------
              Get.previousRoute == "/BookAppointmentScreen"
                  ? SizedBox(height: AppDimensions.mm)
                  : BookAppointmentButtonWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
