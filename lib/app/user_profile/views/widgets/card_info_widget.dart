import 'package:clinic_app/app/user_profile/views/widgets/list_tile_info_profile_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(width * 0.05),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Column(
          children: [
            ListTileInfoProfileWidget(
              title: 'first name',
              text: 'Farah',
              icon: Icons.person_pin_circle_outlined,
            ),
            ListTileInfoProfileWidget(
              title: 'last name',
              text: 'Mikari',
              icon: Icons.person_pin_circle_outlined,
            ),
            ListTileInfoProfileWidget(
              title: 'birthday date',
              text: '21/3/2004',
              icon: Icons.calendar_month_outlined,
            ),
            ListTileInfoProfileWidget(
              title: 'gender',
              text: 'female',
              icon: Icons.transgender,
            ),
            ListTileInfoProfileWidget(
              title: 'phone number',
              text: 'Phone',
              icon: Icons.phone_android_outlined,
            ),
            ListTileInfoProfileWidget(
              title: 'email',
              text: 'farah@gmail.com',
              icon: Icons.email_outlined,
            ),
            ListTileInfoProfileWidget(
              title: 'pasword',
              text: '***********',
              icon: Icons.key,
            ),
          ],
        ),
      ),
    );
  }
}
