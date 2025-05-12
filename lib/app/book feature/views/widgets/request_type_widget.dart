import 'package:clinic_app/app/book%20feature/controllers/picked_appointment_info_bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestTypeWidget extends StatelessWidget {
  const RequestTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<BoxShadow> boxShadow = [
      const BoxShadow(
        color: Color(0x1A000000),
        spreadRadius: 2,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ];
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
              margin: EdgeInsets.all(4.0.wp),
              decoration: BoxDecoration(
                color: AppColors.widgetBackgroundColor,
                borderRadius: BorderRadius.circular(15.0.sp),
                boxShadow: boxShadow,
              ),
              child: GridView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: 2.0.wp,
                  horizontal: 4.0.wp,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0.wp,
                  mainAxisExtent: 6.0.hp,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.read<PickedAppointmentInfoBloc>().add(
                        RequestTypeIdChanged(pickedRequestTypeId: index),
                      );
                    },
                    borderRadius: BorderRadius.circular(15.0.sp),
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
                            borderRadius: BorderRadius.circular(15.0.sp),
                          ),
                          child: Text(
                            index == 0 ? 'Check-Up' : 'Follow-Up',
                            style: TextStyle(
                              color:
                                  state == index
                                      ? AppColors.widgetBackgroundColor
                                      : AppColors.mainTextColor,
                              fontSize: 12.0.sp,
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
          margin: EdgeInsets.all(4.0.wp),
          decoration: BoxDecoration(
            color: AppColors.widgetBackgroundColor,
            borderRadius: BorderRadius.circular(15.0.sp),
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
              size: 20.0.sp,
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
                    fontSize: 12.0.sp,
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
                  size: 20.0.sp,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
