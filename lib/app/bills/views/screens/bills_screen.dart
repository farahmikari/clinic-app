import 'package:clinic_app/app/bills/controllers/fetch_bills_bloc/fetch_bills_bloc.dart';
import 'package:clinic_app/app/bills/views/widgets/bills_widget.dart';
import 'package:clinic_app/app/bills/views/widgets/shimmer_bills_widget.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/widgets/app_bar_with_filter_and_search_widget.dart';
import 'package:clinic_app/core/widgets/empty_list_widget.dart';
import 'package:clinic_app/core/widgets/filter_widget/controllers/filter_bloc/filter_bloc.dart';
import 'package:clinic_app/core/widgets/search_widget/controllers/search_bloc/search_bloc.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    int filterIndex = context.read<FilterBloc>().state.filterIndex;
    String searchWord = context.read<SearchBloc>().state.searchWord;
    context.read<FetchBillsBloc>().add(
      FetchBills(searchWord: searchWord, filterIndex: filterIndex),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FetchBillsBloc()..add(FetchBills())),
        BlocProvider(create: (context) => FilterBloc()),
        BlocProvider(create: (context) => SearchBloc()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FetchBillsBloc, FetchBillsState>(
            listener: (context, state) {
              if (state is FetchBillsLoading) {
                context.read<FilterBloc>().add(FilterWidgetIsDeactivated());
              } else {
                context.read<FilterBloc>().add(FilterWidgetIsActivated());
              }
            },
          ),
          BlocListener<FilterBloc, FilterState>(
            listenWhen: (previous, current) {
              return current.isFilterWidgetActivated == true;
            },
            listener: (context, state) {
              if (state.filterIndex == 1) {
                context.read<FetchBillsBloc>().add(DisplayUnpaidBills());
              } else if (state.filterIndex == 2) {
                context.read<FetchBillsBloc>().add(DisplayPaidBills());
              } else {
                context.read<FetchBillsBloc>().add(DisplayAllBills());
              }
            },
          ),
          BlocListener<SearchBloc, SearchState>(
            listener: (context, state) {
              int filterIndex = context.read<FilterBloc>().state.filterIndex;
              context.read<FetchBillsBloc>().add(
                FetchBills(
                  searchWord: state.searchWord,
                  filterIndex: filterIndex,
                ),
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBarWithFilterAndSearchWidget(
            appBarTitle: S.current.bills,
            filterNames: [S.current.all, S.current.unpaid, S.current.paid],
          ),
          body: SafeArea(
            child: Builder(
              builder: (context) {
                return RefreshIndicator(
                  backgroundColor: Theme.of(context).accentBackgroundColor,
                  color: Theme.of(context).primaryColor,
                  onRefresh: () => _onRefresh(context),
                  child: BlocBuilder<FetchBillsBloc, FetchBillsState>(
                    builder: (context, state) {
                      if (state is FetchBillsLoaded) {
                        return BillsWidget(bills: state.bills);
                      }
                      if (state is FetchBillsLoadedEmpty) {
                        return EmptyListWidget(
                          image: "assets/images/empty_bills.png",
                          title: S.current.bills_empty_title,
                          subtitle: S.current.bills_empty_subtitle,
                        );
                      }
                      return ShimmerBillsWidget();
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
