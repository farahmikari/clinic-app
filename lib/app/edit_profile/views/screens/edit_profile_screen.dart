import 'package:clinic_app/app/edit_profile/controller/bloc/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:clinic_app/app/edit_profile/views/widgets/info_edit_widget.dart';
import 'package:clinic_app/app/user_profile/models/user_data.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.user});
  final UserData user;

  @override
  Widget build(BuildContext context) {
    //final UserData user = Get.arguments;
    final firstNameController = TextEditingController(text: user.firstName);
    final lastNameController = TextEditingController(text: user.lastName);
    final phoneController = TextEditingController(text: user.phoneNumber);
    final emailController = TextEditingController(text: user.email);
    final newEmailController = TextEditingController(text: user.email);
    final birthdayController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(user.birthDate),
    );
    final genderController = TextEditingController(text: user.gender);

    final List<String> genderOption = ['Male', 'Female'];
    String? valueBirth;
    return BlocProvider(
      create: (context) => EditProfileBloc(user),
      child: Scaffold(
      //  backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          iconTheme: IconThemeData(color: AppColors.backgroundColor),
          centerTitle: true,
          title: Text(
            "Edit Info profile",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColors.backgroundColor,
              fontSize: 20,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: InfoEditWidget(firstNameController: firstNameController, lastNameController: lastNameController, birthdayController: birthdayController, valueBirth: valueBirth, genderController: genderController, genderOption: genderOption, phoneController: phoneController, emailController: emailController, newEmailController: newEmailController),
        ),
      ),
    );
  }
}


