import 'package:clinic_app/app/home/controllers/most%20rated%20doctors%20bloc/most_rated_doctors_bloc.dart';
import 'package:clinic_app/app/home/views/widgets/most%20rated%20doctors%20widgets/most_rated_doctors_shimmer_widget.dart';
import 'package:clinic_app/app/home/views/widgets/most%20rated%20doctors%20widgets/most_rated_doctors_widget.dart';
import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MostRatedDoctorsSection extends StatelessWidget {
  const MostRatedDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0.hp,
      margin: EdgeInsets.only(top: AppDimensions.mm),
      child: BlocBuilder<MostRatedDoctorsBloc, MostRatedDoctorsState>(
        builder: (context, state) {
          switch (state) {
            //------------!! Loading State !!------------------------------------------------------------------------------------------------------------------------------------------
            case MostRatedDoctorsLoading():
              return MostRatedDoctorsShimmerWidget();
            //-------------!! Loaded State !!------------------------------------------------------------------------------------------------------------------------------------------
            case MostRatedDoctorsLoaded():
              return MostRatedDoctorsWidget(
                mostRatedDoctors: state.mostRatedDoctors,
              );
            //-------------!! Failure State !!-----------------------------------------------------------------------------------------------------------------------------------------
            case MostRatedDoctorsFailed():
              return Center(child: Text(state.errorMessage));
          }
        },
      ),
    );
  }
}
