import 'package:clinic_app/app/offers/controllers/fetch_offers_bloc/fetch_offers_bloc.dart';
import 'package:clinic_app/app/offers/views/widgets/offers_widget.dart';
import 'package:clinic_app/app/offers/views/widgets/shimmer_offers_widget.dart';

import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/widgets/empty_list_widget.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchOffersBloc()..add(FetchOffers()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.current.offers,
            style: TextStyle(
              fontSize: AppDimensions.lfs,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<FetchOffersBloc, FetchOffersState>(
          builder: (context, state) {
            if (state is FetchOffersLoaded) {
              return OffersWidget(offers: state.offers);
            }
            if (state is FetchOffersLoadedEmpty) {
              return EmptyListWidget(
                image: "assets/images/empty_offers.png",
                title: "No Offers Available",
                subtitle:
                    "There aren’t any special offers right now, but stay tuned — exciting deals are on the way!",
              );
            }
            return ShimmerOffersWidget();
          },
        ),
      ),
    );
  }
}
