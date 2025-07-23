import 'package:clinic_app/core/errors/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ListTileDrawerWidget extends StatelessWidget {
  const ListTileDrawerWidget({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.backgroundIconColor,
    required this.title, this.onTap,
  });
  final IconData icon;
  final Color iconColor;
  final Color backgroundIconColor;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: backgroundIconColor,
              child: Icon(icon, color: iconColor),
            ),
            title: Text(
              title,
              style: TextStyle(
                color: AppColors.mainTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                fontFamily: "Montserat",
              ),
            ),
            trailing:title!='Logout'? Icon(
              Icons.arrow_back_ios,
              textDirection: TextDirection.rtl,
              color: AppColors.hintTextColor,
              size: 12,
            ):null,
          ),
        ),
        Divider(color: AppColors.hintTextColor, thickness: 0.5),
      ],
    );
  }
}
