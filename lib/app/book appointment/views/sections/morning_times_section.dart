import 'package:clinic_app/app/book%20appointment/controllers/morning%20times%20bloc/morning_times_bloc.dart';
import 'package:clinic_app/app/book%20appointment/views/widgets/times_widgets/default_times_widget.dart';
import 'package:clinic_app/app/book%20appointment/views/widgets/times_widgets/morning_times_widget.dart';
import 'package:clinic_app/app/book%20appointment/views/widgets/times_widgets/times_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MorningTimesSection extends StatelessWidget {
  const MorningTimesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MorningTimesBloc, MorningTimesState>(
      builder: (context, state) {
        switch (state) {
          //------------!! Initial State !!----------------------------------------------------------------------------------------------------------------------------------------
          case FetchMorningTimesInitial():
            return DefaultTimesWidget(times: state.morningTimes);
          //------------!! Loading State !!----------------------------------------------------------------------------------------------------------------------------------------
          case FetchMorningTimesLoading():
            return const TimesShimmerWidget();
          //------------!! Loaded State !!-----------------------------------------------------------------------------------------------------------------------------------------
          case FetchMorningTimesLoaded():
            return MorningTimesWidget(times: state.morningTimes);
          //------------!! Failure State !!----------------------------------------------------------------------------------------------------------------------------------------
          case FetchMorningTimesFailed():
            return Center(child: Text(state.errorMessage));
        }
      },
    );
  }
}
