import 'package:clinic_app/app/book_appointment/controllers/fetch_days_bloc/fetch_days_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_times_bloc/fetch_afternoon_times_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_times_bloc/fetch_morning_times_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_times_bloc/fetch_times_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/book_appointment_validator_bloc/book_appointment_validator_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_departments_bloc/fetch_departments_bloc.dart';
import 'package:clinic_app/app/book_appointment/controllers/send_reservation_bloc/send_reservation_bloc.dart';
import 'package:clinic_app/app/book_appointment/models/reservation_model.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/departments_widget/controller/departments_bloc/departments_bloc.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/departments_widget/views/widgets/departments_widget.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/departments_widget/views/widgets/shimmer_departments_widget.dart';
import 'package:clinic_app/app/book_appointment/controllers/fetch_reservation_price_bloc/fetch_reservation_pricing_bloc.dart';
import 'package:clinic_app/app/doctor/views/screens/doctor_profile_screen.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/widgets/button_widget.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/custom_pricing_dialog_widget.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/custom_warning_dialog_widget.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/days_widget/controllers/days_bloc/days_bloc.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/days_widget/views/widgets/days_widget.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/days_widget/views/widgets/shimmer_days_widget.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/request_types_widget/controllers/request%20types%20bloc/request_types_bloc.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/request_types_widget/views/widgets/request_types_widget.dart';
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

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color specifyConfirmButtonBackgroundColor(bool isValid) {
      return isValid
          ? Theme.of(context).primaryColor
          : Theme.of(context).hintTextColor;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.book_appointment,
          style: TextStyle(
            color: Theme.of(context).primaryTextColor,
            fontSize: AppDimensions.lfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) =>
                    FetchDepartmentsBloc()
                      ..add(FetchDepartments(searchWord: "")),
          ),
          BlocProvider(
            create: (context) => FetchDaysBloc()..add(FetchDefaultDays()),
          ),
          BlocProvider(
            create:
                (context) =>
                    FetchMorningTimesBloc()
                      ..add(FetchDefaultTimes(shift: "morning")),
          ),
          BlocProvider(
            create:
                (context) =>
                    FetchAfternoonTimesBloc()
                      ..add(FetchDefaultTimes(shift: "afternoon")),
          ),
          BlocProvider(create: (context) => DepartmentsBloc()),
          BlocProvider(
            create:
                (context) =>
                    RequestTypesBloc()
                      ..add(IsRequestTypesWidgetActivedIsToggled()),
          ),
          BlocProvider(create: (context) => DaysBloc()),
          BlocProvider(create: (context) => TimesBloc()),
          BlocProvider(
            create:
                (context) =>
                    TitledCheckboxBloc()
                      ..add(IsTitledCheckboxWidgetActivatedIsToggled()),
          ),
          BlocProvider(create: (context) => BookAppointmentValidatorBloc()),
          BlocProvider(create: (context) => FetchReservationPricingBloc()),
          BlocProvider(create: (context) => SendReservationBloc()),
        ],
        child: MultiBlocListener(
          listeners: [
            //------------Departments Bloc----------------------
            BlocListener<DepartmentsBloc, DepartmentsState>(
              listener: (context, state) {
                context.read<FetchDaysBloc>().add(
                  FetchDepartmentDays(departmentId: state.currentDepartmentId),
                );
                context.read<DaysBloc>().add(
                  CurrentDepartmentIdIsSetAndCurrentDayIdIsReset(
                    currentDepartmentId: state.currentDepartmentId,
                  ),
                );
                context.read<BookAppointmentValidatorBloc>().add(
                  CheckConfirmAbility(
                    departmentId: state.currentDepartmentId,
                    day: "",
                    doctorId: -1,
                    timeId: -1,
                  ),
                );
              },
            ),
            //------------Request Types Bloc----------------------
            BlocListener<RequestTypesBloc, RequestTypesState>(
              listener: (context, state) {
                context.read<BookAppointmentValidatorBloc>().add(
                  CheckConfirmAbility(
                    requestTypeId: state.currentRequestTypeId,
                  ),
                );
              },
            ),
            //------------Days Bloc----------------------
            BlocListener<DaysBloc, DaysState>(
              listener: (context, state) {
                if (state.currentDay == "") {
                  context.read<FetchMorningTimesBloc>().add(
                    FetchDefaultTimes(shift: "morning"),
                  );
                  context.read<FetchAfternoonTimesBloc>().add(
                    FetchDefaultTimes(shift: "afternoon"),
                  );
                } else {
                  context.read<FetchMorningTimesBloc>().add(
                    FetchTimes(
                      departmentId: state.currentDepartmentId,
                      day: state.currentDay,
                      shift: "morning",
                    ),
                  );
                  context.read<FetchAfternoonTimesBloc>().add(
                    FetchTimes(
                      departmentId: state.currentDepartmentId,
                      day: state.currentDay,
                      shift: "afternoon",
                    ),
                  );
                }
                context.read<TimesBloc>().add(
                  CurrentTimeAndDoctorIdsAreReset(),
                );
                context.read<BookAppointmentValidatorBloc>().add(
                  CheckConfirmAbility(
                    day: state.currentDay,
                    doctorId: -1,
                    timeId: -1,
                  ),
                );
              },
            ),
            //------------Times Bloc----------------------
            BlocListener<TimesBloc, TimesState>(
              listener: (context, state) {
                context.read<BookAppointmentValidatorBloc>().add(
                  CheckConfirmAbility(
                    doctorId: state.currentDoctorId,
                    timeId: state.currentTimeId,
                  ),
                );
              },
            ),
            //------------Titled Checkbox Bloc----------------------
            BlocListener<TitledCheckboxBloc, TitledCheckboxState>(
              listener: (context, state) {
                context.read<BookAppointmentValidatorBloc>().add(
                  CheckConfirmAbility(
                    withMedicalReport: state.isCurrentChecked,
                  ),
                );
              },
            ),
            //-----------Fetch Reservation Pricing-------------------
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

            //------------Send Reservation Bloc----------------------
            BlocListener<SendReservationBloc, SendReservationState>(
              listener: (context, state) {
                if (state is SendReservationLoaded) {
                  Get.back();
                } else if (state is SendReservationFailed) {
                  showDialog(
                    context: context,
                    builder: (_) {
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
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.all(AppDimensions.mp),
              children: [
                BlocBuilder<FetchDepartmentsBloc, FetchDepartmentsState>(
                  builder: (context, state) {
                    if (state is FetchDepartmentsLoaded) {
                      return DepartmentsWidget(departments: state.departments);
                    }
                    return ShimmerDepartmentsWidget();
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
                BlocBuilder<FetchMorningTimesBloc, FetchTimesState>(
                  builder: (context, state) {
                    if (state is FetchTimesLoaded) {
                      return SubtitleWithTextButtonWidget(
                        subtitle: S.current.morning_times,
                        buttonTitle: S.current.doctor,
                        onPressed: () {
                          Get.to(() => DoctorProfileScreen(id: state.doctorId));
                        },
                      );
                    }
                    return SubtitleWidget(subtitle: S.current.morning_times);
                  },
                ),
                SizedBox(height: AppDimensions.mp),
                BlocBuilder<FetchMorningTimesBloc, FetchTimesState>(
                  builder: (context, state) {
                    if (state is FetchTimesLoaded) {
                      return TimesWidget(
                        times: state.dayTimes,
                        currentDoctorId: state.doctorId,
                        shift: "Morning",
                      );
                    }
                    return ShimmerTimesWidget();
                  },
                ),
                SizedBox(height: AppDimensions.mp),
                BlocBuilder<FetchAfternoonTimesBloc, FetchTimesState>(
                  builder: (context, state) {
                    if (state is FetchTimesLoaded) {
                      return SubtitleWithTextButtonWidget(
                        subtitle: S.current.afternoon_times,
                        buttonTitle: S.current.doctor,
                        onPressed: () {
                          Get.to(() => DoctorProfileScreen(id: state.doctorId));
                        },
                      );
                    }
                    return SubtitleWidget(subtitle: S.current.afternoon_times);
                  },
                ),
                SizedBox(height: AppDimensions.mp),
                BlocBuilder<FetchAfternoonTimesBloc, FetchTimesState>(
                  builder: (context, state) {
                    if (state is FetchTimesLoaded) {
                      return TimesWidget(
                        times: state.dayTimes,
                        currentDoctorId: state.doctorId,
                        shift: "Afternoon",
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
                              titleColor: Theme.of(context).foregroundColor,
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
