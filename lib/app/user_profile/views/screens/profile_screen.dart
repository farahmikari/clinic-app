import 'package:clinic_app/app/user_profile/views/widgets/app_bar_profile_widget.dart';
import 'package:clinic_app/app/user_profile/views/widgets/card_info_widget.dart';
import 'package:clinic_app/app/user_profile/views/widgets/edit_info_profile_button_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/widgets/image_widget/controller/bloc/image_bloc/image_bloc.dart';
import 'package:clinic_app/core/widgets/image_widget/controller/service/image_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return BlocProvider(
      create: (context) => ImageBloc(pickimage: ImagePickerService()),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBarProfileWidget(fullName: 'Farah Mikari',width: width, height: height),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EditInfoProfileButtonWidget(text: 'Edit profile',onTap: (){},width: width, height: height),
                  EditInfoProfileButtonWidget(text: 'Edit password',onTap: (){},width: width, height: height),
                ],
              ),
              CardInfoWidget(width:width),
            ],
          ),
        ),
      ),
    );
  }
}

