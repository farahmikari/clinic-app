import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/widgets.dart';

class DoctorNameWidget extends StatelessWidget {
  const DoctorNameWidget({super.key, required this.name, required this.size});
  final String name;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Dr.$name",
      style: TextStyle(
        color: AppColors.mainTextColor,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
