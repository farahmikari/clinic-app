import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ListTileInfoProfileWidget extends StatelessWidget {
  const ListTileInfoProfileWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.title,
  });
  final String text;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: AppColors.primaryColor),
          title: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 10,
              fontFamily: "Montserat",
            ),
          ),
          subtitle: Text(
            text,
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontWeight: FontWeight.w700,
              fontSize: 15,
              fontFamily: "Montserat",
            ),
          ),
        ),
        Divider(color: AppColors.hintTextColor, thickness: 0.3),
      ],
    );
  }
}
