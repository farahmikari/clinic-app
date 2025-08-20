import 'package:clinic_app/app/edit_profile/controller/bloc/edit_passowrd_bloc/edit_password_bloc.dart';
import 'package:clinic_app/app/edit_profile/views/screens/edit_password_screen.dart';
import 'package:clinic_app/app/edit_profile/views/screens/edit_profile_screen.dart';
import 'package:clinic_app/app/user_profile/models/user_data_model.dart';
import 'package:clinic_app/app/user_profile/views/widgets/app_bar_profile_widget.dart';
import 'package:clinic_app/app/user_profile/views/widgets/card_info_widget.dart';
import 'package:clinic_app/app/user_profile/views/widgets/edit_info_profile_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart' as gett;

class ProfileInformationWidget extends StatelessWidget {
  const ProfileInformationWidget({
    super.key,
    required this.width,
    required this.height,
    required this.user,
  });

  final double width;
  final double height;
  final UserDataModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarProfileWidget(
              fullName: "${user.firstName} ${user.lastName}",
              width: width,
              height: height,
              image: user.image,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EditInfoProfileButtonWidget(
                  text: 'Edit profile',
                  onTap: () {
                    gett.Get.to(
                      () => EditProfileScreen(user: user),
                      transition: gett.Transition.cupertino,
                    );
                  },
                  width: width,
                  height: height,
                ),
                EditInfoProfileButtonWidget(
                  text: 'Edit password',
                  onTap: () {
                    gett.Get.to(
                      () => BlocProvider(
                        create: (context) => EditPasswordBloc(),
                        child: EditPasswordScreen(),
                      ),
                      transition: gett.Transition.cupertino,
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
              birthdayDate: user.birthDate,
              email: user.email,
            ),
          ],
        ),
      ),
    );
  }
}
