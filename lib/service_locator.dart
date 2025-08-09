import 'package:clinic_app/app/auth_prompt/controllers/check_user_authentication_bloc/check_user_authentication_bloc.dart';
import 'package:clinic_app/app/onboarding/controllers/onboarding_bloc/onboarding_bloc.dart';
import 'package:get_it/get_it.dart' show GetIt;

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<CheckUserAuthenticationBloc>(
    () => CheckUserAuthenticationBloc(),
  );
  getIt.registerFactory<OnboardingBloc>(() => OnboardingBloc());
}
