import 'package:clinic_app/app/user_profile/views/widgets/list_tile_info_profile_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
    required this.width,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.phone,
    required this.email,
    required this.birthdayDate,
    required this.password,
  });
  final double width;
  final String firstName;
  final String lastName;
  final String gender;
  final String phone;
  final String email;
  final String birthdayDate;
  final String password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(width * 0.05),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          border: Border.all(color: AppColors.primaryColor, width: 2),
        ),
        child: Column(
          children: [
            ListTileInfoProfileWidget(
              title: 'first name',
              text: firstName,
              icon: Icons.person_pin_circle_outlined,
            ),
            ListTileInfoProfileWidget(
              title: 'last name',
              text: lastName,
              icon: Icons.person_pin_circle_outlined,
            ),
            ListTileInfoProfileWidget(
              title: 'birthday date',
              text: birthdayDate,
              icon: Icons.calendar_month_outlined,
            ),
            ListTileInfoProfileWidget(
              title: 'gender',
              text: gender,
              icon: Icons.transgender,
            ),
            ListTileInfoProfileWidget(
              title: 'phone number',
              text: phone,
              icon: Icons.phone_android_outlined,
            ),
            ListTileInfoProfileWidget(
              title: 'email',
              text: email,
              icon: Icons.email_outlined,
            ),
            ListTileInfoProfileWidget(
              title: 'pasword',
              text: password,
              icon: Icons.key,
            ),
          ],
        ),
      ),
    );
  }
}
