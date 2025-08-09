import 'package:clinic_app/app/edit_profile/views/screens/edit_password_screen.dart';
import 'package:clinic_app/app/user_profile/views/widgets/app_bar_profile_widget.dart';
import 'package:clinic_app/app/user_profile/views/widgets/card_info_widget.dart';
import 'package:clinic_app/app/user_profile/views/widgets/edit_info_profile_button_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ProfileInformationWidget extends StatelessWidget {
  const ProfileInformationWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarProfileWidget(
              fullName: 'Farah Mikari',
              width: width,
              height: height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EditInfoProfileButtonWidget(
                  text: 'Edit profile',
                  onTap: () {},
                  width: width,
                  height: height,
                ),
                EditInfoProfileButtonWidget(
                  text: 'Edit password',
                  onTap: () {
                    Get.to(EditPasswordScreen());
                  },
                  width: width,
                  height: height,
                ),
              ],
            ),
            CardInfoWidget(
              width: width,
              firstName: 'Farah',
              lastName: 'Mikari',
              gender: 'Female',
              phone: '09999999999',
              password: '************',
              birthdayDate: '21/3/2004',
              email: 'farah@gmail.com',
            ),
          ],
        ),
      ),
    );
  }
}
