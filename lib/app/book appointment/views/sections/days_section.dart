import 'package:clinic_app/app/book%20appointment/controllers/days%20bloc/days_bloc.dart';
import 'package:clinic_app/app/book%20appointment/views/widgets/days_widgets/days_shimmer_widget.dart';
import 'package:clinic_app/app/book%20appointment/views/widgets/days_widgets/days_widget.dart';
import 'package:clinic_app/app/book%20appointment/views/widgets/days_widgets/default_days_widgets.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DaysSection extends StatelessWidget {
  const DaysSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0.hp,
      margin: EdgeInsets.all(AppDimensions.mm),
      child: BlocBuilder<DaysBloc, DaysState>(
        builder: (context, state) {
          switch (state) {
            //------------!! Initial State !!--------------------------------------------------------------------------------------------------------------------------------------
            case FetchDaysInitial():
              return DefaultDaysWidgets(days: state.days);
            //------------!! Loading State !!--------------------------------------------------------------------------------------------------------------------------------------
            case FetchDaysLoading():
              return const DaysShimmerWidget();
            //------------!! Loaded State !!---------------------------------------------------------------------------------------------------------------------------------------
            case FetchDaysLoaded():
              return DaysWidget(days: state.days);
            //------------!! Failure State !!--------------------------------------------------------------------------------------------------------------------------------------
            case FetchDaysFailed():
              return Text(state.errorMessage);
          }
        },
      ),
    );
  }
}
