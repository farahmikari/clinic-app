import 'package:clinic_app/app/doctor/controllers/doctor%20bloc/doctor_bloc.dart';
import 'package:clinic_app/app/doctor/views/widgets/doctor_widget.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorProfileScreen extends StatelessWidget {
  final int id;
  const DoctorProfileScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorBloc()..add(FetchDoctor(id: id)),
      child: Scaffold(
        //backgroundColor: AppColors.backgroundColor,
        body: BlocBuilder<DoctorBloc, DoctorState>(
          builder: (context, state) {
            if (state is DoctorLoaded) {
              return DoctorWidget(doctor: state.doctor);
            }
            return LoadingWidget();
          },
        ),
      ),
    );
  }
}
