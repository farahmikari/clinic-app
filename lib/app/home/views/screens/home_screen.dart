import 'package:clinic_app/app/home/controllers/most_rated_doctors_bloc/most_rated_doctors_bloc.dart';
import 'package:clinic_app/app/home/views/widgets/app_bar_widgets/home_app_bar_widget.dart';
import 'package:clinic_app/app/home/views/widgets/most_rated_doctors_widgets/shimmer_most_rated_doctors_widget.dart';
import 'package:clinic_app/app/home/views/widgets/most_rated_doctors_widgets/most_rated_doctors_widget.dart';
import 'package:clinic_app/app/home/views/widgets/services%20button%20widgets/services_buttons_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/app/home/views/widgets/card_widget.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    context.read<MostRatedDoctorsBloc>().add(FetchMostRatedDoctors());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MostRatedDoctorsBloc()..add(FetchMostRatedDoctors()),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: HomeAppBarWidget(),
        body: Builder(
          builder: (context) {
            return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              color: AppColors.primaryColor,
              backgroundColor: AppColors.widgetBackgroundColor,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: AppDimensions.mp),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
                    child: Container(
                      height: 15.0.wp,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.mp,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.widgetBackgroundColor,
                        borderRadius: BorderRadius.circular(AppDimensions.lbr),
                        boxShadow: AppShadow.boxShadow,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: AppDimensions.mp,
                        children: [
                          SvgPicture.asset(
                            AppIcons.search,
                            height: AppDimensions.sis,
                            width: AppDimensions.mis,
                            color: AppColors.darkGreyColor,
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                color: AppColors.mainTextColor,
                                fontSize: AppDimensions.mfs,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText:
                                    "Doctor, Symptom, Facility, Specialty...",
                                hintStyle: TextStyle(
                                  color: AppColors.hintTextColor,
                                  fontSize: AppDimensions.mfs,
                                  fontWeight: FontWeight.w500,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.all(0.0),
                              ),
                              cursorColor: AppColors.mainTextColor,
                              autocorrect: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppDimensions.mp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
                    child: SubtitleWidget(subtitle: "Most Rated"),
                  ),
                  SizedBox(height: AppDimensions.mp),
                  BlocBuilder<MostRatedDoctorsBloc, MostRatedDoctorsState>(
                    builder: (context, state) {
                      if (state is MostRatedDoctorsLoaded) {
                        return MostRatedDoctorsWidget(
                          mostRatedDoctors: state.mostRatedDoctors,
                        );
                      }
                      return ShimmerMostRatedDoctorsWidget();
                    },
                  ),
                  SizedBox(height: AppDimensions.mp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
                    child: CardWidget(),
                  ),
                  SizedBox(height: AppDimensions.mp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
                    child: SubtitleWidget(subtitle: "Services"),
                  ),
                  SizedBox(height: AppDimensions.mp),
                  ServicesButtonsWidget(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
