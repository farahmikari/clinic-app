import 'package:clinic_app/app/appointments/models/appointment_model.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_days_bloc/fetch_days_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_times_bloc/fetch_times_bloc.dart';
import 'package:clinic_app/app/manage_booking/controllers/fetch_new_reservation_bloc/fetch_new_reservation_bloc.dart';
import 'package:clinic_app/app/manage_booking/controllers/manage_booking_validator_bloc/manage_booking_validator_bloc.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/widgets/app_bar_with_badge_widget.dart';
import 'package:clinic_app/core/widgets/button_widget.dart';
import 'package:clinic_app/core/widgets/days_widget/controllers/days_bloc/days_bloc.dart';
import 'package:clinic_app/core/widgets/days_widget/views/widgets/days_widget.dart';
import 'package:clinic_app/core/widgets/days_widget/views/widgets/shimmer_days_widget.dart';
import 'package:clinic_app/core/widgets/request_types_widget/controllers/request%20types%20bloc/request_types_bloc.dart';
import 'package:clinic_app/core/widgets/request_types_widget/views/widgets/request_types_widget.dart';
import 'package:clinic_app/core/widgets/reservation_summary_widget.dart';
import 'package:clinic_app/core/widgets/subtitle_widget.dart';
import 'package:clinic_app/core/widgets/subtitle_with_text_button_widget.dart';
import 'package:clinic_app/core/widgets/times_widget/controllers/times_bloc/times_bloc.dart';
import 'package:clinic_app/core/widgets/times_widget/views/widgets/shimmer_times_widget.dart';
import 'package:clinic_app/core/widgets/times_widget/views/widgets/times_widget.dart';
import 'package:clinic_app/core/widgets/titled_checkbox_widget/controllers/titled_checkbox_bloc/titled_checkbox_bloc.dart';
import 'package:clinic_app/core/widgets/titled_checkbox_widget/views/widgets/titled_checkbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageBookingScreen extends StatelessWidget {
  const ManageBookingScreen({super.key, required this.appointment});
  final AppointmentModel appointment;
  @override
  Widget build(BuildContext context) {
    String specifyButtonTitle({required bool isReservationEditing}) {
      return isReservationEditing ? "Editing" : "Edit";
    }

    String specifyTitle({required bool isReservationEditing}) {
      return isReservationEditing ? "Edit" : "Cancel";
    }

    Color specifyBackgroundColor({
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
                  ManageBookingValidatorBloc()..add(
                    CancelAbilityIsChecked(appointmentId: appointment.id),
                  ),
        ),
        BlocProvider(
          create:
              (context) =>
                  FetchNewReservationBloc()..add(
                    NewReservationIsFetched(appointmentId: appointment.id),
                  ),
        ),
        BlocProvider(create: (context) => FetchDaysBloc()),
        BlocProvider(create: (context) => FetchTimesBloc()),
        BlocProvider(create: (context) => RequestTypesBloc()),
        BlocProvider(create: (context) => DaysBloc()),
        BlocProvider(create: (context) => TimesBloc()),
        BlocProvider(create: (context) => TitledCheckboxBloc()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FetchNewReservationBloc, FetchNewReservationState>(
            listener: (context, state) {
              if (state is FetchNewReservationLoaded) {
                context.read<RequestTypesBloc>().add(
                  CurrentAndPreviousRequestTypeIdsAreSet(
                    currentAndPreviousRequestTypeIds:
                        state.reservation.requestTypeId,
                  ),
                );
                context.read<FetchDaysBloc>().add(
                  state.reservation.offerId == null
                      ? FetchDepartmentDays(
                        departmentId: state.reservation.departmentId,
                      )
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
        ],
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBarWithBadgeWidget(
            title: "Manage Booking",
            badgeTitle: "Upcoming",
            badgeColor: AppColors.transparentGreen,
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
                      subtitle: "Reservation Info",
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
                        if (state.isReservationEditing) {
                          context.read<ManageBookingValidatorBloc>().add(
                            CancelAbilityIsChecked(
                              appointmentId: appointment.id,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: AppDimensions.mp),
                RequestTypesWidget(),
                SizedBox(height: AppDimensions.mp),
                SubtitleWidget(subtitle: "Days"),
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
                SubtitleWidget(subtitle: "Times"),
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
                TitledCheckboxWidget(title: "Do you need a medical report"),
                SizedBox(height: AppDimensions.mp),
                BlocBuilder<
                  ManageBookingValidatorBloc,
                  ManageBookingValidatorState
                >(
                  builder: (context, state) {
                    return ButtonWidget(
                      title: specifyTitle(
                        isReservationEditing: state.isReservationEditing,
                      ),
                      backgroundColor: specifyBackgroundColor(
                        isReservationEditing: state.isReservationEditing,
                        isAbleToCancel: state.isAbleToCancel,
                        isAbleToEdit: state.isAbleToEdit,
                      ),
                      titleColor: AppColors.widgetBackgroundColor,
                      onTap: () {},
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
