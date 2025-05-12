import 'package:clinic_app/app/doctor/controllers/doctor_bloc/doctor_bloc.dart';
import 'package:clinic_app/app/doctor/views/widgets/bio_widget.dart';
import 'package:clinic_app/app/doctor/views/widgets/book_appointment_button_widget.dart';
import 'package:clinic_app/app/doctor/views/widgets/core_speciality_widget.dart';
import 'package:clinic_app/app/doctor/views/widgets/experience_widget.dart';
import 'package:clinic_app/app/doctor/views/widgets/name_widget.dart';
import 'package:clinic_app/app/doctor/views/widgets/profile_photo_widget.dart';
import 'package:clinic_app/app/doctor/views/widgets/qualifications_widget.dart';
import 'package:clinic_app/app/doctor/views/widgets/rate_widget.dart';
import 'package:clinic_app/app/doctor/views/widgets/shift_widget.dart';
import 'package:clinic_app/app/doctor/views/widgets/treatments_widgets.dart';
import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DoctorProfileScreen extends StatefulWidget {
  final int id;
  const DoctorProfileScreen({super.key, required this.id});

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DoctorBloc>(),
      child: Builder(
        builder: (context) {
          context.read<DoctorBloc>().add(FetchDoctor(id: widget.id));
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: BlocBuilder<DoctorBloc, DoctorState>(
              builder: (context, state) {
                switch (state) {
                  case DoctorLoading():
                    return Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: AppColors.primaryColor,
                        size: 8.0.hp,
                      ),
                    );
                  case DoctorLoaded():
                    return Column(
                      children: [
                        //------------------------Doctor Profile Photo------------------------------------------------------------
                        Expanded(
                          flex: 1,
                          child: ProfilePhotoWidget(image: state.doctor.image),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //----------------Doctor Name & Specialty-----------------------------------------------------------
                              ListTile(
                                title: NameWidget(name: state.doctor.name),
                                subtitle: CoreSpecialtyWidget(
                                  specialty: state.doctor.specialty,
                                ),
                              ),
                              //-------------------Doctor Shift & Rate------------------------------------------------------------
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4.0.wp,
                                  ),
                                  child: Row(
                                    children: [
                                      ShiftWidget(
                                        startHour: state.doctor.startHour,
                                        endHour: state.doctor.endHour,
                                      ),
                                      RateWidget(rate: state.doctor.rate),
                                    ],
                                  ),
                                ),
                              ),
                              //--------------Doctor Eperience & Treatments--------------------------------------------------------
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4.0.wp,
                                  ),
                                  child: Row(
                                    children: [
                                      ExperienceWidget(
                                        experience: state.doctor.experience,
                                      ),
                                      TreatmentsWidgets(
                                        treatments: state.doctor.treatments,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //----------------------Doctor Bio-------------------------------------------------------------------
                              Expanded(
                                flex: 3,
                                child: BioWidget(bio: state.doctor.bio),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 4.0.wp,
                                  vertical: 2.0.wp,
                                ),
                                title: Text(
                                  "Qualifications",
                                  style: TextStyle(
                                    color: AppColors.mainTextColor,
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              //-------------------Doctor Qualifications------------------------------------------------------------
                              Expanded(
                                flex: 2,
                                child: QualificationsWidget(
                                  qualifications: state.doctor.qualifications,
                                ),
                              ),
                              //------------------Book Appointment Button------------------------------------------------------------
                              Get.previousRoute == "/BookAppointmentScreen"
                                  ? SizedBox(height: 4.0.wp)
                                  : Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0.wp),
                                      child: BookAppointmentButtonWidget(),
                                    ),
                                  ),
                            ],
                          ),
                        ),
                      ],
                    );
                  case DoctorFailed():
                    return Center(child: Text(state.errorMessage));
                }
              },
            ),
          );
        },
      ),
    );
  }
}
