import 'package:clinic_app/app/home/controllers/most%20rated%20doctors%20bloc/most_rated_doctors_bloc.dart';
import 'package:clinic_app/app/home/views/sections/most_rated_doctors_section.dart';
import 'package:clinic_app/app/home/views/widgets/services%20button%20widgets/services_buttons_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/app/home/views/widgets/card_widget.dart';
import 'package:clinic_app/app/home/views/widgets/search_widget.dart';
import 'package:clinic_app/core/widgets/subtitle_widget.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    context.read<MostRatedDoctorsBloc>().add(FetchMostRatedDoctors());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: getIt<MostRatedDoctorsBloc>()),],
      child: Builder(
        builder: (context) {
          return RefreshIndicator(
            onRefresh: () => _onRefresh(context),
            color: AppColors.primaryColor,
            backgroundColor: AppColors.widgetBackgroundColor,
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.only(top: AppDimensions.sp),
                children: [
                  //-----------------|Search Text Field|-----------------------------------------------------------------------------------------------------------------------------------------
                  SearchWidget(),
                  //----------------|Most Rated Subtitle|----------------------------------------------------------------------------------------------------------------------------------------
                  SubtitleWidget(subtitle: "Most Rated"),
                  //-----------------|Most Rated Doctors|----------------------------------------------------------------------------------------------------------------------------------------
                  MostRatedDoctorsSection(),
                  //------------------------|Card|---------------------------------------------------------------------------------------------------------------------------------------------
                  CardWidget(),
                  //------------------|Services Subtitle|--------------------------------------------------------------------------------------------------------------------------------------
                  SubtitleWidget(subtitle: "Services"),
                  //-------------------|Services Buttons|--------------------------------------------------------------------------------------------------------------------------------------
                  ServicesButtonsWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
