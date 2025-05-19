import 'package:clinic_app/app/book%20appointment/controllers/afternoon%20times%20bloc/afternoon_times_bloc.dart';
import 'package:clinic_app/app/book%20appointment/views/widgets/times_widgets/afternoon_times_widget.dart';
import 'package:clinic_app/app/book%20appointment/views/widgets/times_widgets/default_times_widget.dart';
import 'package:clinic_app/app/book%20appointment/views/widgets/times_widgets/times_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AfternoonTimesSection extends StatelessWidget {
  const AfternoonTimesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AfternoonTimesBloc, AfternoonTimesState>(
      builder: (context, state) {
        switch (state) {
          //------------!! Initial State !!----------------------------------------------------------------------------------------------------------------------------------------
          case FetchAfternoonTimesInitial():
            return DefaultTimesWidget(times: state.afternoonTimes);
          //------------!! Loading State !!----------------------------------------------------------------------------------------------------------------------------------------
          case FetchAfternoonTimesLoading():
            return const TimesShimmerWidget();
          //------------!! Loaded State !!-----------------------------------------------------------------------------------------------------------------------------------------
          case FetchAfternoonTimesLoaded():
            return AfternoonTimesWidget(times: state.afternoonTimes);
          //------------!! Failure State !!----------------------------------------------------------------------------------------------------------------------------------------
          case FetchAfternoonTimesFailed():
            return Center(child: Text(state.errorMessage));
        }
      },
    );
  }
}
