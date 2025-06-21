import 'package:clinic_app/app/appointment_details/controllers/completed_appointment_details_bloc/fetch_completed_appointment_details_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_days_bloc/fetch_days_bloc.dart';
import 'package:clinic_app/app/appointment_details/controllers/fetch_reservation_bloc/fetch_reservation_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_times_bloc/fetch_times_bloc.dart';
import 'package:clinic_app/app/appointment_details/controllers/upcoming_validator_bloc/upcoming_validator_bloc.dart';
import 'package:clinic_app/app/appointments/controllers/appointments%20bloc/appointments_bloc.dart';
import 'package:clinic_app/app/appointments/controllers/filter%20bloc/filter_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_departments_bloc/fetch_departments_bloc.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/departments_widget/controller/departments_bloc/departments_bloc.dart';
import 'package:clinic_app/app/bottom_navigation_bar/controllers/bottom%20navigation%20bar%20bloc/bottom_navigation_bar_bloc.dart';
import 'package:clinic_app/app/doctor/controllers/doctor%20bloc/doctor_bloc.dart';
import 'package:clinic_app/app/home/controllers/most%20rated%20doctors%20bloc/most_rated_doctors_bloc.dart';
import 'package:clinic_app/app/onboarding/controllers/onboarding_bloc/onboarding_bloc.dart';
import 'package:clinic_app/core/widgets/days_widget/controllers/days_bloc/days_bloc.dart';
import 'package:clinic_app/core/widgets/request%20types%20widget/controllers/request%20types%20bloc/request_types_bloc.dart';
import 'package:clinic_app/core/widgets/times_widget/controllers/times%20bloc/times_bloc.dart';
import 'package:clinic_app/core/widgets/titled_checkbox_widget/controllers/titled_checkbox_bloc/titled_checkbox_bloc.dart';
import 'package:get_it/get_it.dart' show GetIt;

final getIt = GetIt.instance;

void setup() {
  ///getIt.registerFactory<DaysBloc>(() => DaysBloc());
  getIt.registerLazySingleton(() => MostRatedDoctorsBloc());
  getIt.registerFactory(() => DoctorBloc());
  getIt.registerLazySingleton(() => AppointmentsBloc());
  getIt.registerLazySingleton(() => FilterBloc());
  getIt.registerLazySingleton(() => BottomNavigationBarBloc());
  getIt.registerFactory(() => DepartmentsBloc());
  getIt.registerFactory(() => RequestTypesBloc());
  getIt.registerFactory(() => DaysBloc());
  getIt.registerFactory(() => TimesBloc(), instanceName: "Edit");
  getIt.registerFactory(() => TimesBloc(), instanceName: "Morning");
  getIt.registerFactory(() => TimesBloc(), instanceName: "Afternoon");
  getIt.registerFactory(() => FetchDepartmentsBloc());
  getIt.registerFactory(() => FetchDaysBloc());
  getIt.registerFactory(() => FetchTimesBloc());
  getIt.registerFactory(() => UpcomingValidatorBloc());
  getIt.registerFactory(() => FetchReservationBloc());
  getIt.registerFactory(() => TitledCheckboxBloc());
  getIt.registerFactory(() => FetchCompletedAppointmentDetailsBloc());
  getIt.registerFactory<OnboardingBloc>(() => OnboardingBloc());
  // Alternatively you could write it if you don't like global variables
  //GetIt.I.registerLazySingleton<AppModel>(AppModel());
}
