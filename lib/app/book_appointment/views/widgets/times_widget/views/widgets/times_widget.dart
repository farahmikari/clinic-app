import 'dart:math';

import 'package:clinic_app/app/book_appointment/models/time_model.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/times_widget/controllers/times_bloc/times_bloc.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/times_widget/views/items/times_grid_view_item.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimesWidget extends StatelessWidget {
  const TimesWidget({
    super.key,
    required this.times,
    required this.currentDoctorId,
    required this.shift,
  });

  final List<TimeModel> times;
  final int currentDoctorId;
  final String shift;

  @override
  Widget build(BuildContext context) {
    int specifyItemCount() {
      late bool isDroppedDown;
      if (shift == "Morning") {
        isDroppedDown =
            context.read<TimesBloc>().state.areMorningTimesDroppedDown;
        return isDroppedDown ? times.length : min(times.length, 5);
      } else {
        isDroppedDown =
            context.read<TimesBloc>().state.areAfternoonTimesDroppedDown;
        return isDroppedDown ? times.length : min(times.length, 5);
      }
    }

    String specifyDropDownButtonTitle() {
      late bool isDroppedDown;
      if (shift == "Morning") {
        isDroppedDown =
            context.read<TimesBloc>().state.areMorningTimesDroppedDown;
        return isDroppedDown ? S.current.less : S.current.more;
      } else {
        isDroppedDown =
            context.read<TimesBloc>().state.areAfternoonTimesDroppedDown;
        return isDroppedDown ? S.current.less : S.current.more;
      }
    }

    return BlocBuilder<TimesBloc, TimesState>(
      builder: (context, state) {
        return TimesGridViewItem(
          times: times,
          currentDoctorId: currentDoctorId,
          currentTimeId: state.currentTimeId,
          previousTimeId: state.previousTimeId,
          currentDay: state.currentDay,
          previousDay: state.previousDay,
          itemCount: specifyItemCount(),
          dropDownButtonTitle: specifyDropDownButtonTitle(),
          shift: shift,
          isTimesWidgetActivated: state.isTimesWidgetActivated,
        );
      },
    );
  }
}
