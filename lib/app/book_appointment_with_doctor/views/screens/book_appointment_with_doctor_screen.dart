import 'package:clinic_app/app/book_appointment/controllers/book_appointment_validator_bloc/book_appointment_validator_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_days_bloc/fetch_days_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_times_bloc/fetch_times_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/send_reservation_bloc/send_reservation_bloc.dart';
import 'package:clinic_app/app/book_appointment/models/reservation_model.dart';
import 'package:clinic_app/app/book_appointment_with_doctor/views/widgets/doctor_summary_widget.dart';
import 'package:clinic_app/app/book_appointment_with_offer/controllers/fetch_reservation_price_bloc/fetch_reservation_pricing_bloc.dart';
import 'package:clinic_app/app/doctor/models/doctor_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/widgets/button_widget.dart';
import 'package:clinic_app/core/widgets/custom_pricing_dialog_widget.dart';
import 'package:clinic_app/core/widgets/custom_warning_dialog_widget.dart';
import 'package:clinic_app/core/widgets/days_widget/controllers/days_bloc/days_bloc.dart';
import 'package:clinic_app/core/widgets/days_widget/views/widgets/days_widget.dart';
import 'package:clinic_app/core/widgets/days_widget/views/widgets/shimmer_days_widget.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:clinic_app/core/widgets/request_types_widget/controllers/request%20types%20bloc/request_types_bloc.dart';
import 'package:clinic_app/core/widgets/request_types_widget/views/widgets/request_types_widget.dart';
import 'package:clinic_app/core/widgets/subtitle_widget.dart';
import 'package:clinic_app/core/widgets/times_widget/controllers/times_bloc/times_bloc.dart';
import 'package:clinic_app/core/widgets/times_widget/views/widgets/shimmer_times_widget.dart';
import 'package:clinic_app/core/widgets/times_widget/views/widgets/times_widget.dart';
import 'package:clinic_app/core/widgets/titled_checkbox_widget/controllers/titled_checkbox_bloc/titled_checkbox_bloc.dart';
import 'package:clinic_app/core/widgets/titled_checkbox_widget/views/widgets/titled_checkbox_widget.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class BookAppointmentWithDoctorScreen extends StatelessWidget {
  const BookAppointmentWithDoctorScreen({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    Color specifyConfirmButtonBackgroundColor(bool isValid) {
      return isValid ? AppColors.primaryColor : AppColors.hintTextColor;
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  RequestTypesBloc()
                    ..add(IsRequestTypesWidgetActivedIsToggled()),
        ),
        BlocProvider(
          create:
              (context) => DaysBloc()..add(IsDaysWidgetActivatedIsToggled()),
        ),
        BlocProvider(
          create:
              (context) =>
                  FetchDaysBloc()..add(FetchDoctorDays(doctorId: doctor.id)),
        ),
        BlocProvider(
          create:
              (context) => TimesBloc()..add(IsTimesWidgetActivatedIsToggled()),
        ),
        BlocProvider(
          create:
              (context) =>
                  FetchTimesBloc()
                    ..add(FetchDefaultTimes(shift: doctor.shift.toLowerCase())),
        ),
        BlocProvider(
          create:
              (context) =>
                  TitledCheckboxBloc()
                    ..add(IsTitledCheckboxWidgetActivatedIsToggled()),
        ),
        BlocProvider(
          create:
              (context) =>
                  BookAppointmentValidatorBloc()..add(
                    CheckConfirmAbility(
                      departmentId: doctor.departmentId,
                      doctorId: doctor.id,
                    ),
                  ),
        ),
        BlocProvider(create: (context) => FetchReservationPricingBloc()),
        BlocProvider(create: (context) => SendReservationBloc()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<RequestTypesBloc, RequestTypesState>(
            listenWhen:
                (previous, current) =>
                    previous.currentRequestTypeId !=
                    current.currentRequestTypeId,
            listener: (context, state) {
              context.read<BookAppointmentValidatorBloc>().add(
                CheckConfirmAbility(requestTypeId: state.currentRequestTypeId),
              );
            },
          ),
          BlocListener<DaysBloc, DaysState>(
            listenWhen: (previous, current) => current.currentDay != "",
            listener: (context, state) {
              context.read<FetchTimesBloc>().add(
                FetchTimes(
                  departmentId: doctor.departmentId,
                  day: state.currentDay,
                  shift: doctor.shift.toLowerCase(),
                ),
              );
              context.read<TimesBloc>().add(CurrentTimeAndDoctorIdsAreReset());
              context.read<BookAppointmentValidatorBloc>().add(
                CheckConfirmAbility(day: state.currentDay, timeId: -1),
              );
            },
          ),
          BlocListener<TimesBloc, TimesState>(
            listener: (context, state) {
              context.read<BookAppointmentValidatorBloc>().add(
                CheckConfirmAbility(timeId: state.currentTimeId),
              );
            },
          ),
          BlocListener<TitledCheckboxBloc, TitledCheckboxState>(
            listener: (context, state) {
              context.read<BookAppointmentValidatorBloc>().add(
                CheckConfirmAbility(withMedicalReport: state.isCurrentChecked),
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
                                .read<BookAppointmentValidatorBloc>()
                                .state
                                .currentReservation;
                        context.read<SendReservationBloc>().add(
                          SendReservation(reservation: reservation),
                        );
                        Get.back();
                      },
                    );
                  },
                );
              } else if (state is FetchReservationPricingFailed) {
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
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            surfaceTintColor: AppColors.backgroundColor,
            title: Text(
              S.current.book_appointment,
              style: TextStyle(
                fontSize: AppDimensions.lfs,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.all(AppDimensions.mp),
              children: [
                DoctorSummaryWidget(doctor: doctor),
                SizedBox(height: AppDimensions.mp),
                SubtitleWidget(subtitle: S.current.reservation_info),
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
                        currentDoctorId: 1,
                        shift: "Morning",
                      );
                    }
                    return ShimmerTimesWidget();
                  },
                ),
                SizedBox(height: AppDimensions.mp),
                TitledCheckboxWidget(title: S.current.need_medical_report),
                SizedBox(height: AppDimensions.mp),
                BlocBuilder<
                  BookAppointmentValidatorBloc,
                  BookAppointmentValidatorState
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
                              title: S.current.confirm,
                              backgroundColor:
                                  specifyConfirmButtonBackgroundColor(
                                    validatorState.isValid,
                                  ),
                              titleColor: AppColors.widgetBackgroundColor,
                              onTap: () {
                                if (validatorState.isValid) {
                                  context
                                      .read<FetchReservationPricingBloc>()
                                      .add(
                                        FetchReservationPricing(
                                          reservation:
                                              validatorState.currentReservation,
                                        ),
                                      );
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
