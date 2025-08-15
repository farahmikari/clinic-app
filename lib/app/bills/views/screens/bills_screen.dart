import 'package:clinic_app/app/bills/controllers/fetch_bills_bloc/fetch_bills_bloc.dart';
import 'package:clinic_app/app/bills/views/widgets/bills_widget.dart';
import 'package:clinic_app/app/bills/views/widgets/shimmer_bills_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/widgets/app_bar_with_filter_and_search_widget.dart';
import 'package:clinic_app/core/widgets/filter_widget/controllers/filter_bloc/filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    context.read<FetchBillsBloc>().add(FetchBills());
    context.read<FilterBloc>().add(FilterIsReset());
  }

  @override
  Widget build(BuildContext context) {
    List<String> filters = ["All", "Unpaid", "Paid"];
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FetchBillsBloc()..add(FetchBills())),
        BlocProvider(
          create:
              (context) => FilterBloc()..add(FitlersAreSet(filters: filters)),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FetchBillsBloc, FetchBillsState>(
            listener: (context, state) {
              if (state is FetchBillsLoaded) {
                context.read<FilterBloc>().add(FilterWidgetIsActivated());
              }
            },
          ),
          BlocListener<FilterBloc, FilterState>(
            listenWhen: (previous, current) {
              return current.isFilterWidgetActivated == true;
            },
            listener: (context, state) {
              if (state.filterName == "Unpaid") {
                context.read<FetchBillsBloc>().add(DisplayUnpaidBills());
              } else if (state.filterName == "Paid") {
                context.read<FetchBillsBloc>().add(DisplayPaidBills());
              } else {
                context.read<FetchBillsBloc>().add(DisplayAllBills());
              }
            },
          ),
        ],
        child: Scaffold(
          //backgroundColor: AppColors.backgroundColor,
          appBar: AppBarWithFilterAndSearchWidget(
            appBarTitle: "Bills",
            searchHintText: "Department, Doctor, Date...",
            whiteFilterName: "All",
            greenFilterName: "Unpaid",
            yelloFilterName: "Paid",
          ),
          body: Builder(
            builder: (context) {
              return RefreshIndicator(
                backgroundColor: AppColors.backgroundColor,
                color: AppColors.primaryColor,
                onRefresh: () => _onRefresh(context),
                child: BlocBuilder<FetchBillsBloc, FetchBillsState>(
                  builder: (context, state) {
                    if (state is FetchBillsLoaded) {
                      return BillsWidget(bills: state.bills);
                    }
                    return ShimmerBillsWidget();
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
