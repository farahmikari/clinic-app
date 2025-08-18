import 'package:clinic_app/app/home/controllers/most_rated_doctors_bloc/most_rated_doctors_bloc.dart';
import 'package:clinic_app/app/home/views/widgets/app_bar_widgets/home_app_bar_widget.dart';
import 'package:clinic_app/app/home/views/widgets/latest_offers_widgets/latest_offers_widget.dart';
import 'package:clinic_app/app/home/views/widgets/latest_offers_widgets/shimmer_latest_offers_widget.dart';
import 'package:clinic_app/app/home/views/widgets/most_rated_doctors_widgets/shimmer_most_rated_doctors_widget.dart';
import 'package:clinic_app/app/home/views/widgets/most_rated_doctors_widgets/most_rated_doctors_widget.dart';
import 'package:clinic_app/app/home/views/widgets/services%20button%20widgets/services_buttons_widget.dart';
import 'package:clinic_app/app/offers/controllers/fetch_offers_bloc/fetch_offers_bloc.dart';
import 'package:clinic_app/app/offers/views/screens/offers_screen.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/app/home/views/widgets/card_widget.dart';
import 'package:clinic_app/core/widgets/subtitle_widget.dart';
import 'package:clinic_app/core/widgets/subtitle_with_text_button_widget.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    context.read<FetchOffersBloc>().add(FetchOffers());
    context.read<MostRatedDoctorsBloc>().add(FetchMostRatedDoctors());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => MostRatedDoctorsBloc()..add(FetchMostRatedDoctors()),
        ),
        BlocProvider(
          create: (context) => FetchOffersBloc()..add(FetchOffers()),
        ),
      ],
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
                padding: EdgeInsets.only(bottom: AppDimensions.mp),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
                    child: SubtitleWithTextButtonWidget(
                      subtitle: S.current.latest_offers,
                      buttonTitle: S.current.see_more,
                      onPressed: () {
                        Get.to(() => OffersScreen());
                      },
                    ),
                  ),
                  SizedBox(height: AppDimensions.mp),
                  BlocBuilder<FetchOffersBloc, FetchOffersState>(
                    builder: (context, state) {
                      if (state is FetchOffersLoaded) {
                        return LatestOffersWidget(offers: state.offers);
                      }
                      return ShimmerLatestOffersWidget();
                    },
                  ),
                  SizedBox(height: AppDimensions.mp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
                    child: SubtitleWidget(subtitle: S.current.most_rated),
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
                    child: SubtitleWidget(subtitle: S.current.services),
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
