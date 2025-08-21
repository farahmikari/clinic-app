import 'package:clinic_app/app/appointments/views/widgets/appointments_auth_decision_widget.dart';
import 'package:clinic_app/app/bills/views/widgets/bills_auth_decision_widget.dart';
import 'package:clinic_app/app/bottom_navigation_bar/controllers/bottom_navigation_bar_bloc/bottom_navigation_bar_bloc.dart';
import 'package:clinic_app/app/bottom_navigation_bar/views/widgets/salomon_bottom_bar_widget.dart';
import 'package:clinic_app/app/departments/views/screens/departments_screen.dart';
import 'package:clinic_app/app/home/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => BottomNavigationBarBloc()..add(CurrentIndexChanged(0)),
      child: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: state.currentIndex,
              children: [
                state.isHomeBlocsInitialized ? const HomeScreen() : SizedBox(),
                state.isAppointmentsBlocsInitialized
                    ? const AppointmentsAuthDecisionWidget()
                    : SizedBox(),
                state.isDepartmentsBlocsInitialized
                    ? const DepartmentsScreen()
                    : SizedBox(),
                state.isBillsBlocsInitialized
                    ? const BillsAuthDecisionWidget()
                    : SizedBox(),
              ],
            ),
            bottomNavigationBar: SafeArea(
              child: SalomonBottomBarWidget(currentIndex: state.currentIndex),
            ),
          );
        },
      ),
    );
  }
}
