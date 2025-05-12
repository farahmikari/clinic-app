import 'package:clinic_app/bloc/onboarding_bloc/onboarding_event.dart';
import 'package:clinic_app/bloc/onboarding_bloc/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState()) {
    on<OnboardingEvent>((event, emit) {
      return emit(OnboardingState(pageIndex: state.pageIndex));
    });
  }
}
