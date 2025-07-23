import 'package:clinic_app/app/appointments/controllers/appointments%20bloc/appointments_bloc.dart';
import 'package:clinic_app/app/appointments/controllers/filter%20bloc/filter_bloc.dart';
import 'package:clinic_app/app/bottom_navigation_bar/controllers/bottom%20navigation%20bar%20bloc/bottom_navigation_bar_bloc.dart';
import 'package:clinic_app/app/home/controllers/most%20rated%20doctors%20bloc/most_rated_doctors_bloc.dart';
import 'package:clinic_app/app/onboarding/controllers/onboarding_bloc/onboarding_bloc.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'package:get_storage/get_storage.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => MostRatedDoctorsBloc());
  getIt.registerLazySingleton(() => AppointmentsBloc());
  getIt.registerLazySingleton(() => FilterBloc());
  getIt.registerLazySingleton(() => BottomNavigationBarBloc());
  getIt.registerFactory<OnboardingBloc>(() => OnboardingBloc());
  getIt.registerSingleton<GetStorage>(GetStorage());
}
