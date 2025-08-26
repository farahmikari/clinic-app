import 'package:clinic_app/app/user_profile/views/widgets/list_tile_info_profile_widget.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/generated/l10n.dart';
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
          color: Theme.of(context).primaryBackgroundColor,
          border: Border.all(color: Theme.of(context).primaryColor, width: 2),
        ),
        child: Column(
          children: [
            ListTileInfoProfileWidget(
              title: S.current.first_name,
              text: firstName,
              icon: Icons.person_pin_circle_outlined,
            ),
            ListTileInfoProfileWidget(
              title: S.current.last_name,
              text: lastName,
              icon: Icons.person_pin_circle_outlined,
            ),
            ListTileInfoProfileWidget(
              title: S.current.birthday_date,
              text: birthdayDate,
              icon: Icons.calendar_month_outlined,
            ),
            ListTileInfoProfileWidget(
              title: S.current.gender,
              text: gender,
              icon: Icons.transgender,
            ),
            ListTileInfoProfileWidget(
              title: S.current.gender,
              text: phone,
              icon: Icons.phone_android_outlined,
            ),
            ListTileInfoProfileWidget(
              title: S.current.email,
              text: email,
              icon: Icons.email_outlined,
            ),
            ListTileInfoProfileWidget(
              title: S.current.password,
              text: password,
              icon: Icons.key,
            ),
          ],
        ),
      ),
    );
  }
}
