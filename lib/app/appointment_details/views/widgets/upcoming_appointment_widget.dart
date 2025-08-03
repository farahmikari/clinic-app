import 'package:clinic_app/app/appointment_details/controllers/send_cancel_or_edit_reservation_bloc/send_cancel_or_edit_reservation_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_days_bloc/fetch_days_bloc.dart';
import 'package:clinic_app/app/appointment_details/controllers/fetch_reservation_bloc/fetch_reservation_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_times_bloc/fetch_times_bloc.dart';
import 'package:clinic_app/app/appointment_details/controllers/upcoming_validator_bloc/upcoming_validator_bloc.dart';
import 'package:clinic_app/app/appointment_details/views/widgets/reservation_summary_widgets/reservation_summary_widget.dart';
import 'package:clinic_app/app/appointments/models/appointment_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/button_widget.dart';
import 'package:clinic_app/core/widgets/custom_dialog_widget.dart';
import 'package:clinic_app/core/widgets/days_widget/controllers/days_bloc/days_bloc.dart';
import 'package:clinic_app/core/widgets/days_widget/views/widgets/days_widget.dart';
import 'package:clinic_app/core/widgets/days_widget/views/widgets/shimmer_days_widget.dart';
import 'package:clinic_app/core/widgets/request_types_widget/controllers/request%20types%20bloc/request_types_bloc.dart';
import 'package:clinic_app/core/widgets/request_types_widget/views/widgets/request_types_widget.dart';
import 'package:clinic_app/core/widgets/subtitle_widget.dart';
import 'package:clinic_app/core/widgets/subtitle_with_text_button_widget.dart';
import 'package:clinic_app/core/widgets/times_widget/controllers/times%20bloc/times_bloc.dart';
import 'package:clinic_app/core/widgets/times_widget/views/widgets/shimmer_times_widget.dart';
import 'package:clinic_app/core/widgets/times_widget/views/widgets/times_widget.dart';
import 'package:clinic_app/core/widgets/titled_checkbox_widget/controllers/titled_checkbox_bloc/titled_checkbox_bloc.dart';
import 'package:clinic_app/core/widgets/titled_checkbox_widget/views/widgets/titled_checkbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class UpcomingAppointmentWidget extends StatelessWidget {
  const UpcomingAppointmentWidget({super.key, required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    String specifyEditButtonTitle({required bool isReservationEditing}) {
      return isReservationEditing ? "Editing" : "Edit";
    }

    String specifyCancelAndEditButtonTitle({
      required bool isReservationEditing,
    }) {
      return isReservationEditing ? "Edit" : "Cancel";
    }

    Color specifyCancelAndEditButtonBackgroundColor({
      required bool isReservationEditing,
      required bool isAbleToCancel,
      required bool isAbleToEdit,
    }) {
      if (isReservationEditing) {
        if (isAbleToEdit) {
          return AppColors.primaryColor;
        } else {
          return AppColors.hintTextColor;
        }
      } else {
        if (isAbleToCancel) {
          return AppColors.primaryColor;
        } else {
          return AppColors.hintTextColor;
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
                  UpcomingValidatorBloc()..add(
                    CancelAbilityIsChecked(appointmentId: appointment.id),
                  ),
        ),
        BlocProvider(
          create:
              (context) =>
                  FetchReservationBloc()
                    ..add(FetchReservation(appointmentId: appointment.id)),
        ),
        BlocProvider(create: (context) => FetchDaysBloc()),
        BlocProvider(create: (context) => FetchTimesBloc()),
        BlocProvider(create: (context) => RequestTypesBloc()),
        BlocProvider(create: (context) => DaysBloc()),
        BlocProvider(create: (context) => TimesBloc()),
        BlocProvider(create: (context) => TitledCheckboxBloc()),
        BlocProvider(create: (context) => SendCancelOrEditReservationBloc()),
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
                  FetchDays(departmentId: state.reservation.departmentId),
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
                context.read<UpcomingValidatorBloc>().add(
                  CurrentAndPreviousReservationAreSet(
                    currentAndPreviousreservation: state.reservation,
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
              context.read<UpcomingValidatorBloc>().add(
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
              context.read<UpcomingValidatorBloc>().add(
                EditAbilityIsChecked(requestTypeId: state.currentRequestTypeId),
              );
            },
          ),
          BlocListener<TitledCheckboxBloc, TitledCheckboxState>(
            listenWhen:
                (previous, current) =>
                    previous.isCurrentChecked != current.isCurrentChecked,
            listener: (context, state) {
              context.read<UpcomingValidatorBloc>().add(
                EditAbilityIsChecked(withMedicalReport: state.isCurrentChecked),
              );
            },
          ),
          BlocListener<TimesBloc, TimesState>(
            listenWhen:
                (previous, current) =>
                    previous.currentTimeId != current.currentTimeId,
            listener: (context, state) {
              context.read<UpcomingValidatorBloc>().add(
                EditAbilityIsChecked(timeId: state.currentTimeId),
              );
            },
          ),
          BlocListener<
            SendCancelOrEditReservationBloc,
            SendCancelOrEditReservationState
          >(
            listener: (context, state) {
              if (state is SendCancelOrEditReservationLoaded) {
                Get.back();
              } else if (state is SendCancelOrEditReservationFailed) {
                showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return CustomDialogWidget(
                      title: "Oops!",
                      content: state.errorMessage,
                      buttonTitle: "Ok",
                      onPressed: () {
                        Get.back();
                      },
                    );
                  },
                );
              }
            },
          ),
        ],
        child: ListView(
          padding: EdgeInsets.all(AppDimensions.mp),
          children: [
            ReservationSummaryWidget(appointment: appointment),
            SizedBox(height: AppDimensions.mp),
            BlocBuilder<UpcomingValidatorBloc, UpcomingValidatorState>(
              builder: (context, state) {
                return SubtitleWithTextButtonWidget(
                  subtitle: "Reservation Info",
                  buttonTitle: specifyEditButtonTitle(
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
                    context.read<UpcomingValidatorBloc>().add(
                      IsReservationEditingIsToggled(),
                    );
                    if (state.isReservationEditing) {
                      context.read<UpcomingValidatorBloc>().add(
                        CancelAbilityIsChecked(appointmentId: appointment.id),
                      );
                    }
                  },
                );
              },
            ),
            SizedBox(height: AppDimensions.mp),
            RequestTypesWidget(),
            SizedBox(height: AppDimensions.mp),
            SubtitleWidget(subtitle: "Date"),
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
            SubtitleWidget(subtitle: "Time"),
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
            TitledCheckboxWidget(title: "Do you need a medical report?"),
            SizedBox(height: AppDimensions.mp),
            BlocBuilder<
              SendCancelOrEditReservationBloc,
              SendCancelOrEditReservationState
            >(
              builder: (context, state) {
                if (state is SendCancelOrEditReservationLoading) {
                  return Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: AppColors.primaryColor,
                      size: 8.0.hp,
                    ),
                  );
                }
                return BlocBuilder<
                  UpcomingValidatorBloc,
                  UpcomingValidatorState
                >(
                  builder: (context, state) {
                    return ButtonWidget(
                      title: specifyCancelAndEditButtonTitle(
                        isReservationEditing: state.isReservationEditing,
                      ),
                      backgroundColor:
                          specifyCancelAndEditButtonBackgroundColor(
                            isReservationEditing: state.isReservationEditing,
                            isAbleToCancel: state.isAbleToCancel,
                            isAbleToEdit: state.isAbleToEdit,
                          ),
                      titleColor: AppColors.widgetBackgroundColor,
                      onTap: () {
                        if (state.isReservationEditing) {
                          if (state.isAbleToEdit) {
                            context.read<SendCancelOrEditReservationBloc>().add(
                              SendEditReservation(
                                appointmentId: appointment.id,
                                reservation: state.currentReservation,
                              ),
                            );
                          }
                        } else {
                          if (state.isAbleToCancel) {
                            context.read<SendCancelOrEditReservationBloc>().add(
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
            ),
          ],
        ),
      ),
    );
  }
}
