import 'package:clinic_app/app/appointments/models/appointment_model.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_days_bloc/fetch_days_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_times_bloc/fetch_times_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/send_reservation_bloc/send_reservation_bloc.dart';
import 'package:clinic_app/app/book_appointment/models/reservation_model.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_reservation_price_bloc/fetch_reservation_pricing_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_reservation_bloc/fetch_reservation_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/manage_booking_validator_bloc/manage_booking_validator_bloc.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/widgets/app_bar_with_badge_widget.dart';
import 'package:clinic_app/core/widgets/button_widget.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/custom_pricing_dialog_widget.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/custom_warning_dialog_widget.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/days_widget/controllers/days_bloc/days_bloc.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/days_widget/views/widgets/days_widget.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/days_widget/views/widgets/shimmer_days_widget.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/request_types_widget/controllers/request%20types%20bloc/request_types_bloc.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/request_types_widget/views/widgets/request_types_widget.dart';
import 'package:clinic_app/core/widgets/reservation_summary_widget.dart';
import 'package:clinic_app/core/widgets/subtitle_widget.dart';
import 'package:clinic_app/core/widgets/subtitle_with_text_button_widget.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/times_widget/controllers/times_bloc/times_bloc.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/times_widget/views/widgets/shimmer_times_widget.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/times_widget/views/widgets/times_widget.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/titled_checkbox_widget/controllers/titled_checkbox_bloc/titled_checkbox_bloc.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/titled_checkbox_widget/views/widgets/titled_checkbox_widget.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class ManageBookingScreen extends StatelessWidget {
  const ManageBookingScreen({super.key, required this.appointment});
  final AppointmentModel appointment;
  @override
  Widget build(BuildContext context) {
    String specifyButtonTitle({required bool isReservationEditing}) {
      return isReservationEditing ? S.current.editing : S.current.edit;
    }

    String specifyTitle({required bool isReservationEditing}) {
      return isReservationEditing ? S.current.edit : S.current.cancel;
    }

    Color specifyprimaryBackgroundColor({
      required bool isReservationEditing,
      required bool isAbleToCancel,
      required bool isAbleToEdit,
    }) {
      if (isReservationEditing) {
        if (isAbleToEdit) {
          return Theme.of(context).primaryColor;
        } else {
          return Theme.of(context).hintTextColor;
        }
      } else {
        if (isAbleToCancel) {
          return Theme.of(context).primaryColor;
        } else {
          return Theme.of(context).hintTextColor;
        }
      }
    }

    int setCurrentTimeId({
      required String currentDay,
      required String previousDay,
      required int previousTimeId,
    }) {
      return currentDay == previousDay ? previousTimeId : -1;
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  ManageBookingValidatorBloc()..add(
                    ManageAbilityIsChecked(appointmentId: appointment.id),
                  ),
        ),
        BlocProvider(
          create:
              (context) =>
                  FetchReservationBloc()..add(
                    NewReservationIsFetched(appointmentId: appointment.id),
                  ),
        ),
        BlocProvider(create: (context) => FetchDaysBloc()),
        BlocProvider(create: (context) => FetchTimesBloc()),
        BlocProvider(create: (context) => RequestTypesBloc()),
        BlocProvider(create: (context) => DaysBloc()),
        BlocProvider(create: (context) => TimesBloc()),
        BlocProvider(create: (context) => TitledCheckboxBloc()),
        BlocProvider(create: (context) => FetchReservationPricingBloc()),
        BlocProvider(create: (context) => SendReservationBloc()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FetchReservationBloc, FetchReservationState>(
            listener: (context, state) {
              if (state is FetchReservationLoaded) {
                context.read<RequestTypesBloc>().add(
                  CurrentAndPreviousRequestTypeIdsAreSet(
                    currentAndPreviousRequestTypeIds:
                        state.reservation.requestTypeId,
                  ),
                );
                context.read<FetchDaysBloc>().add(
                  state.reservation.offerId == null
                      ? FetchDoctorDays(doctorId: state.reservation.doctorId)
                      : FetchOfferDays(offerId: state.reservation.offerId!),
                );
                context.read<DaysBloc>().add(
                  CurrentDepartmentIdAndCurrentAndPreviousDayAndPreviousTimeIdAreSet(
                    currentDepartmentId: state.reservation.departmentId,
                    currentAndPreviousDay: state.reservation.day,
                    previousTimeId: state.reservation.timeId,
                  ),
                );
                context.read<TitledCheckboxBloc>().add(
                  CurrentAndPreviousCheckAreSet(
                    currentAndPreviousCheck:
                        state.reservation.withMedicalReport,
                  ),
                );
                context.read<ManageBookingValidatorBloc>().add(
                  CurrentAndPreviousReservationAreSet(
                    currentAndPreviousReservation: state.reservation,
                  ),
                );
              }
            },
          ),
          BlocListener<DaysBloc, DaysState>(
            listenWhen:
                (previous, current) =>
                    previous.currentDay != current.currentDay,
            listener: (context, state) {
              context.read<FetchTimesBloc>().add(
                FetchTimes(
                  departmentId: state.currentDepartmentId,
                  day: state.currentDay,
                  shift: appointment.shift,
                ),
              );
              context.read<TimesBloc>().add(
                CurrentAndPreviousDayAndCurrentAndPreviousTimeIdsAreSet(
                  currentDay: state.currentDay,
                  previousDay: state.previousDay,
                  currentTimeId: setCurrentTimeId(
                    currentDay: state.currentDay,
                    previousDay: state.previousDay,
                    previousTimeId: state.previousTimeId,
                  ),
                  previousTimeId: state.previousTimeId,
                ),
              );
              context.read<ManageBookingValidatorBloc>().add(
                EditAbilityIsChecked(day: state.currentDay, timeId: -1),
              );
            },
          ),
          BlocListener<RequestTypesBloc, RequestTypesState>(
            listenWhen:
                (previous, current) =>
                    previous.currentRequestTypeId !=
                    current.currentRequestTypeId,
            listener: (context, state) {
              context.read<ManageBookingValidatorBloc>().add(
                EditAbilityIsChecked(requestTypeId: state.currentRequestTypeId),
              );
            },
          ),
          BlocListener<TitledCheckboxBloc, TitledCheckboxState>(
            listenWhen:
                (previous, current) =>
                    previous.isCurrentChecked != current.isCurrentChecked,
            listener: (context, state) {
              context.read<ManageBookingValidatorBloc>().add(
                EditAbilityIsChecked(withMedicalReport: state.isCurrentChecked),
              );
            },
          ),
          BlocListener<TimesBloc, TimesState>(
            listenWhen:
                (previous, current) =>
                    previous.currentTimeId != current.currentTimeId,
            listener: (context, state) {
              context.read<ManageBookingValidatorBloc>().add(
                EditAbilityIsChecked(timeId: state.currentTimeId),
              );
            },
          ),
          BlocListener<
            FetchReservationPricingBloc,
            FetchReservationPricingState
          >(
            listener: (context, state) {
              if (state is FetchReservationPricingLoaded) {
                showDialog(
                  context: context,
                  builder: (_) {
                    return CustomPricingDialogWidget(
                      pricing: state.pricing,
                      onCancel: () => Get.back(),
                      onKeepGoing: () {
                        ReservationModel reservation =
                            context
                                .read<ManageBookingValidatorBloc>()
                                .state
                                .currentReservation;
                        context.read<SendReservationBloc>().add(
                          SendEditReservation(
                            appointmentId: appointment.id,
                            reservation: reservation,
                          ),
                        );
                        Get.back();
                      },
                    );
                  },
                );
              } else if (state is FetchReservationPricingFailed) {
                showDialog(
                  context: context,
                  builder: (_) {
                    return CustomWarningDialogWidget(
                      warning: state.errorMessage,
                      onOk: () => Get.back(),
                    );
                  },
                );
              }
            },
          ),
          BlocListener<SendReservationBloc, SendReservationState>(
            listener: (context, state) {
              if (state is SendReservationLoaded) {
                Get.back();
              } else if (state is SendReservationFailed) {
                showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return CustomWarningDialogWidget(
                      warning: state.errorMessage,
                      onOk: () {
                        Get.back();
                      },
                    );
                  },
                );
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBarWithBadgeWidget(
            title: S.current.manage_booking,
            badgeTitle: "Upcoming",
            badgeColor: Theme.of(context).transparentPrimaryColor,
          ),
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.all(AppDimensions.mp),
              children: [
                ReservationSummaryWidget(appointment: appointment),
                SizedBox(height: AppDimensions.mp),
                BlocBuilder<
                  ManageBookingValidatorBloc,
                  ManageBookingValidatorState
                >(
                  builder: (context, state) {
                    return SubtitleWithTextButtonWidget(
                      subtitle: S.current.reservation_info,
                      buttonTitle: specifyButtonTitle(
                        isReservationEditing: state.isReservationEditing,
                      ),
                      onPressed: () {
                        context.read<RequestTypesBloc>().add(
                          IsRequestTypesWidgetActivedIsToggled(),
                        );
                        context.read<DaysBloc>().add(
                          IsDaysWidgetActivatedIsToggled(),
                        );
                        context.read<TimesBloc>().add(
                          IsTimesWidgetActivatedIsToggled(),
                        );
                        context.read<TitledCheckboxBloc>().add(
                          IsTitledCheckboxWidgetActivatedIsToggled(),
                        );
                        context.read<ManageBookingValidatorBloc>().add(
                          IsReservationEditingIsToggled(),
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: AppDimensions.mp),
                RequestTypesWidget(),
                SizedBox(height: AppDimensions.mp),
                SubtitleWidget(subtitle: S.current.days),
                SizedBox(height: AppDimensions.mp),
                BlocBuilder<FetchDaysBloc, FetchDaysState>(
                  builder: (context, state) {
                    if (state is FetchDaysLoaded) {
                      return DaysWidget(days: state.days);
                    }
                    return ShimmerDaysWidget();
                  },
                ),
                SizedBox(height: AppDimensions.mp),
                SubtitleWidget(subtitle: S.current.times),
                SizedBox(height: AppDimensions.mp),
                BlocBuilder<FetchTimesBloc, FetchTimesState>(
                  builder: (context, state) {
                    if (state is FetchTimesLoaded) {
                      return TimesWidget(
                        times: state.dayTimes,
                        currentDoctorId: state.doctorId,
                        shift: appointment.shift,
                      );
                    }
                    return ShimmerTimesWidget();
                  },
                ),
                SizedBox(height: AppDimensions.mp),
                TitledCheckboxWidget(title: S.current.need_medical_report),
                SizedBox(height: AppDimensions.mp),
                BlocBuilder<
                  ManageBookingValidatorBloc,
                  ManageBookingValidatorState
                >(
                  builder: (context, validatorState) {
                    return BlocBuilder<
                      FetchReservationPricingBloc,
                      FetchReservationPricingState
                    >(
                      builder: (context, state) {
                        if (state is FetchReservationPricingLoading) {
                          return LoadingWidget();
                        }
                        return BlocBuilder<
                          SendReservationBloc,
                          SendReservationState
                        >(
                          builder: (context, state) {
                            if (state is SendReservationLoading) {
                              return LoadingWidget();
                            }
                            return ButtonWidget(
                              title: specifyTitle(
                                isReservationEditing:
                                    validatorState.isReservationEditing,
                              ),
                              backgroundColor: specifyprimaryBackgroundColor(
                                isReservationEditing:
                                    validatorState.isReservationEditing,
                                isAbleToCancel: validatorState.isAbleToCancel,
                                isAbleToEdit: validatorState.isAbleToEdit,
                              ),
                              titleColor: Theme.of(context).foregroundColor,
                              onTap: () {
                                if (validatorState.isReservationEditing) {
                                  if (validatorState.isAbleToEdit) {
                                    context
                                        .read<FetchReservationPricingBloc>()
                                        .add(
                                          FetchReservationPricing(
                                            reservation:
                                                validatorState
                                                    .currentReservation,
                                          ),
                                        );
                                  }
                                } else {
                                  if (validatorState.isAbleToCancel) {
                                    context.read<SendReservationBloc>().add(
                                      SendCancelReservation(
                                        appointmentId: appointment.id,
                                      ),
                                    );
                                  }
                                }
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
