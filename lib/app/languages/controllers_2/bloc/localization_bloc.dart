import 'package:clinic_app/core/services/shared_preferences/shared_pereference_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationInitial()) {
    on<LocaleIsChanged>((event, emit) {
      if (event.locale == state.locale) return;
      Get.updateLocale(event.locale);
      SharedPreferencesService.saveLocale(event.locale);
      emit(LocalizationUpdate(locale: event.locale));
    });

    on<SavedLocaleIsFetched>((event, emit) async {
      Locale savedLocale = await SharedPreferencesService.getLocale();
      Get.updateLocale(savedLocale);
      emit(LocalizationUpdate(locale: savedLocale));
    });
  }
}
