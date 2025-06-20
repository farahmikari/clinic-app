import 'package:clinic_app/app/book%20appointment/controllers/picked%20appointment%20info%20bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestTypeWidget extends StatelessWidget {
  const RequestTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocSelector<
          PickedAppointmentInfoBloc,
          PickedAppointmentInfoState,
          bool
        >(
          selector: (state) {
            return state.drawRequestTypes;
          },
          builder: (context, state) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: state ? 16.0.hp : 8.0.hp,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(AppDimensions.mm),
              decoration: BoxDecoration(
                color: AppColors.widgetBackgroundColor,
                borderRadius: BorderRadius.circular(AppDimensions.mbr),
                boxShadow: AppShadow.boxShadow,
              ),
              child: GridView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.mp,
                  vertical: AppDimensions.sp,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppDimensions.mm,
                  mainAxisExtent: 6.0.hp,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.read<PickedAppointmentInfoBloc>().add(
                        RequestTypeIdChanged(pickedRequestTypeId: index),
                      );
                    },
                    borderRadius: BorderRadius.circular(AppDimensions.mbr),
                    child: BlocSelector<
                      PickedAppointmentInfoBloc,
                      PickedAppointmentInfoState,
                      int
                    >(
                      selector: (state) {
                        return state.pickedRequestTypeId;
                      },
                      builder: (context, state) {
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                state == index
                                    ? AppColors.primaryColor
                                    : AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.mbr,
                            ),
                          ),
                          child: Text(
                            index == 0 ? 'Check-Up' : 'Follow-Up',
                            style: TextStyle(
                              color:
                                  state == index
                                      ? AppColors.widgetBackgroundColor
                                      : AppColors.mainTextColor,
                              fontSize: AppDimensions.mfs,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                itemCount: 2,
              ),
            );
          },
        ),
        Container(
          height: 8.0.hp,
          alignment: Alignment.center,
          margin: EdgeInsets.all(AppDimensions.mm),
          decoration: BoxDecoration(
            color: AppColors.widgetBackgroundColor,
            borderRadius: BorderRadius.circular(AppDimensions.mbr),
          ),
          child: ListTile(
            splashColor: Colors.transparent,
            onTap: () {
              context.read<PickedAppointmentInfoBloc>().add(
                RequestTypesDrawToggled(),
              );
            },
            leading: Icon(
              Icons.description_outlined,
              color: AppColors.darkGreyColor,
              size: AppDimensions.sis,
            ),
            title: BlocSelector<
              PickedAppointmentInfoBloc,
              PickedAppointmentInfoState,
              int
            >(
              selector: (state) {
                return state.pickedRequestTypeId;
              },
              builder: (context, state) {
                return Text(
                  state == 0
                      ? "Check-Up"
                      : state == 1
                      ? "Follow-Up"
                      : 'Request Type',
                  style: TextStyle(
                    color: AppColors.darkGreyColor,
                    fontSize: AppDimensions.mfs,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                );
              },
            ),
            trailing: BlocSelector<
              PickedAppointmentInfoBloc,
              PickedAppointmentInfoState,
              bool
            >(
              selector: (state) {
                return state.drawRequestTypes;
              },
              builder: (context, state) {
                return Icon(
                  state
                      ? Icons.arrow_drop_up_rounded
                      : Icons.arrow_drop_down_rounded,
                  color: AppColors.primaryColor,
                  size: AppDimensions.sis,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
