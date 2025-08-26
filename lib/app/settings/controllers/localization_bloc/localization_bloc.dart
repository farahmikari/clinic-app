import 'package:clinic_app/app/settings/models/localization_mode_model.dart';
import 'package:clinic_app/core/services/shared_preferences/shared_pereference_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationInitial()) {
    late Locale locale;
    on<LocalizationModeIsChanged>((event, emit) {
      if (event.localizationMode == state.localizationMode) return;
      SharedPreferencesService.saveLocalizationMode(event.localizationMode);
      switch (event.localizationMode) {
        case LocalizationMode.system:
          locale = Get.deviceLocale ?? Locale('en');
          break;
        case LocalizationMode.english:
          locale = Locale('en');
          break;
        case LocalizationMode.arabic:
          locale = Locale('ar');
          break;
      }
      Get.updateLocale(locale);
      emit(
        LocalizationUpdate(
          locale: locale,
          localizationMode: event.localizationMode,
        ),
      );
    });

    on<SavedLocalizationModeIsFetched>((event, emit) async {
      LocalizationMode savedLocalizationMode =
          await SharedPreferencesService.getLocalizationMode();
      switch (savedLocalizationMode) {
        case LocalizationMode.system:
          locale = Get.deviceLocale ?? Locale('en');
          break;
        case LocalizationMode.english:
          locale = Locale('en');
          break;
        case LocalizationMode.arabic:
          locale = Locale('ar');
          break;
      }
      Get.updateLocale(locale);
      emit(
        LocalizationUpdate(
          locale: locale,
          localizationMode: savedLocalizationMode,
        ),
      );
    });
  }
}
