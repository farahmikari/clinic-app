import 'package:clinic_app/app/offers/controllers/fetch_offers_bloc/fetch_offers_bloc.dart';
import 'package:clinic_app/app/offers/controllers/fetch_user_points_bloc/fetch_user_points_bloc.dart';
import 'package:clinic_app/app/offers/views/widgets/points_widget.dart';
import 'package:clinic_app/app/offers/views/widgets/offers_widget.dart';
import 'package:clinic_app/app/offers/views/widgets/shimmer_points_widget.dart';
import 'package:clinic_app/app/offers/views/widgets/shimmer_offers_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchOffersBloc()..add(FetchOffers()),
        ),
        BlocProvider(
          create: (context) => FetchUserPointsBloc()..add(FetchUserPoints()),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          surfaceTintColor: AppColors.backgroundColor,
          title: Text(
            S.current.offers,
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontSize: AppDimensions.lfs,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(AppDimensions.mp),
          clipBehavior: Clip.none,
          children: [
            BlocBuilder<FetchUserPointsBloc, FetchUserPointsState>(
              builder: (context, state) {
                if (state is FetchUserPointsLoaded) {
                  return PointsWidget(userPoints: state.userPoints);
                }
                return ShimmerPointsWidget();
              },
            ),
            SizedBox(height: AppDimensions.mp),
            BlocBuilder<FetchOffersBloc, FetchOffersState>(
              builder: (context, state) {
                if (state is FetchOffersLoaded) {
                  return OffersWidget(offers: state.offers);
                }
                return ShimmerOffersWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}
