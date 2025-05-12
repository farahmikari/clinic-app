part of 'doctor_bloc.dart';

sealed class DoctorEvent {}

class FetchDoctor extends DoctorEvent {
  final int id;

  FetchDoctor({required this.id});
}
