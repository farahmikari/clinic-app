import 'package:clinic_app/app/book_appointment/models/day_model.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/days_widget/controllers/days_bloc/days_bloc.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/days_widget/views/items/days_grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DaysWidget extends StatelessWidget {
  const DaysWidget({super.key, required this.days});

  final List<DayModel> days;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DaysBloc, DaysState>(
      builder: (context, state) {
        return DaysGridViewItem(
          days: days,
          currentDay: state.currentDay,
          previousDay: state.previousDay,
          isDaysWidgetActivated: state.isDaysWidgetActivated,
        );
      },
    );
  }
}
