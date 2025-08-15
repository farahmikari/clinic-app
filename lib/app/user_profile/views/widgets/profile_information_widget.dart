import 'package:clinic_app/app/edit_profile/views/screens/edit_password_screen.dart';
import 'package:clinic_app/app/edit_profile/views/screens/edit_profile_screen.dart';
import 'package:clinic_app/app/user_profile/models/user_data.dart';
import 'package:clinic_app/app/user_profile/views/widgets/app_bar_profile_widget.dart';
import 'package:clinic_app/app/user_profile/views/widgets/card_info_widget.dart';
import 'package:clinic_app/app/user_profile/views/widgets/edit_info_profile_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ProfileInformationWidget extends StatelessWidget {
  const ProfileInformationWidget({
    super.key,
    required this.width,
    required this.height, required this.user,
  });

  final double width;
  final double height;
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: AppColors.backgroundColor,
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
                  onTap: () {
                    Get.to(()=>
                      EditProfileScreen(user: user,),
                      transition: Transition.cupertino,
                    );
                  },
                  width: width,
                  height: height,
                ),
                EditInfoProfileButtonWidget(
                  text: 'Edit password',
                  onTap: () {
                    Get.to(()=>
                      EditPasswordScreen(),
                      transition: Transition.cupertino,
                    );
                  },
                  width: width,
                  height: height,
                ),
              ],
            ),
            CardInfoWidget(
              width: width,
              firstName: user.firstName,
              lastName: user.lastName,
              gender: user.gender,
              phone: user.phoneNumber,
              password: '************',
              birthdayDate: user.gender,
              email: user.email,
            ),
          ],
        ),
      ),
    );
  }
}
