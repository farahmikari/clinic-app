import 'package:clinic_app/app/appointments/controllers/appointments%20bloc/appointments_bloc.dart';
import 'package:clinic_app/app/appointments/controllers/filter%20bloc/filter_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/afternoon%20times%20bloc/afternoon_times_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/confirm%20bloc/confirm_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/days%20bloc/days_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/department%20doctor%20bloc/department_doctor_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/departments%20bloc/departments_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/morning%20times%20bloc/morning_times_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/picked%20appointment%20info%20bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/app/bottom%20navigation%20bar/controllers/bottom%20navigation%20bar%20bloc/bottom_navigation_bar_bloc.dart';
import 'package:clinic_app/app/doctor/controllers/doctor%20bloc/doctor_bloc.dart';
import 'package:clinic_app/app/home/controllers/most%20rated%20doctors%20bloc/most_rated_doctors_bloc.dart';
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
  getIt.registerSingleton<AppointmentsBloc>(AppointmentsBloc());
  getIt.registerSingleton<FilterBloc>(FilterBloc());
  getIt.registerSingleton<BottomNavigationBarBloc>(BottomNavigationBarBloc());
  // Alternatively you could write it if you don't like global variables
  //GetIt.I.registerSingleton<AppModel>(AppModel());
}
