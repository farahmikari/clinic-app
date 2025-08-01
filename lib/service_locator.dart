import 'package:clinic_app/app/onboarding/controllers/onboarding_bloc/onboarding_bloc.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'package:get_storage/get_storage.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerFactory<OnboardingBloc>(() => OnboardingBloc());
  getIt.registerSingleton<GetStorage>(GetStorage());
}
