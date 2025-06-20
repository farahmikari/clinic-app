import 'package:clinic_app/app/book%20feature/controllers/afternoon_times_bloc/afternoon_times_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/confirm_bloc/confirm_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/days_bloc/days_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/department_doctor_bloc/department_doctor_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/departments_bloc/departments_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/morning_times_bloc/morning_times_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/picked_appointment_info_bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/app/doctor/controllers/doctor_bloc/doctor_bloc.dart';
import 'package:clinic_app/app/home/controllers/most_rated_doctors_bloc/most_rated_doctors_bloc.dart';
import 'package:clinic_app/app/onboarding/controllers/onboarding_bloc/onboarding_bloc.dart';
import 'package:get_it/get_it.dart' show GetIt;

final getIt = GetIt.instance;

void setup() {
  getIt.registerFactory<DepartmentsBloc>(() => DepartmentsBloc());
  getIt.registerFactory<DaysBloc>(() => DaysBloc());
  getIt.registerFactory<MorningTimesBloc>(() => MorningTimesBloc());
  getIt.registerFactory<AfternoonTimesBloc>(() => AfternoonTimesBloc());
  getIt.registerFactory<PickedAppointmentInfoBloc>(
    () => PickedAppointmentInfoBloc(),
  );
  getIt.registerSingleton<MostRatedDoctorsBloc>(MostRatedDoctorsBloc());
  getIt.registerFactory<DoctorBloc>(() => DoctorBloc());
  getIt.registerFactory<DepartmentDoctorBloc>(() => DepartmentDoctorBloc());
  getIt.registerFactory<ConfirmBloc>(() => ConfirmBloc());
  // Alternatively you could write it if you don't like global variables
  //GetIt.I.registerSingleton<AppModel>(AppModel());
  getIt.registerFactory<OnboardingBloc>(() => OnboardingBloc());

}
