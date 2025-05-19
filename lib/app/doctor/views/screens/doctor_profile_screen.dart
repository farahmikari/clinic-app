import 'package:clinic_app/app/doctor/controllers/doctor%20bloc/doctor_bloc.dart';
import 'package:clinic_app/app/doctor/views/sections/doctor_section.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorProfileScreen extends StatefulWidget {
  final int id;
  const DoctorProfileScreen({super.key, required this.id});

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DoctorBloc>(),
      child: Builder(
        builder: (context) {
          context.read<DoctorBloc>().add(FetchDoctor(id: widget.id));
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: SafeArea(child: DoctorSection()),
          );
        },
      ),
    );
  }
}
