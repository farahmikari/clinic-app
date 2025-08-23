import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clinic_app/app/edit_profile/controller/bloc/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:clinic_app/app/edit_profile/views/widgets/info_edit_widget.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_bloc.dart';
import 'package:clinic_app/app/user_drawer/views/screen/drawer_screen.dart';
import 'package:clinic_app/app/user_profile/models/user_data_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/utils/snack_bar_util.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.user});
  final UserDataModel user;

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController(text: user.firstName);
    final lastNameController = TextEditingController(text: user.lastName);
    final phoneController = TextEditingController(text: user.phoneNumber);
    final emailController = TextEditingController(text: user.email);
    final newEmailController = TextEditingController(text: user.email);
    final birthdayController = TextEditingController(text: user.birthDate);
    final genderController = TextEditingController(text: user.gender);

    final List<String> genderOption = [S.current.male, S.current.female];
    String? valueBirth;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EditProfileBloc(user)),
        BlocProvider(create: (context) => EmailBloc()),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          iconTheme: IconThemeData(color: AppColors.primaryBackgroundColor),
          centerTitle: true,
          title: Text(
            S.current.edit_profile,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColors.primaryBackgroundColor,
              fontSize: 20,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<EditProfileBloc, EditProfileBaseState>(
            listener: (context, state) async {
              switch (state) {
                case EditProfileSuccess():
                  showSnackBar(
                    context,
                    title: S.current.success,
                    message: S.current.edit_profile_successfully,
                    contentType: ContentType.success,
                  );
                  await await Future.delayed(Duration(seconds: 2));
                  Get.off(() => DrawerScreen());
                  break;

                case EditProfileFailed():
                  showSnackBar(
                    context,
                    title: S.current.failed,
                    message: S.current.failed_edit_profile,
                    contentType: ContentType.failure,
                  );
                  break;
                default:
                  break;
              }
            },
            builder: (context, state) {
              final editData = state.data;
              final bool isLoading = state is EditProfileLoading;
              return InfoEditWidget(
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                birthdayController: birthdayController,
                valueBirth: valueBirth,
                genderController: genderController,
                genderOption: genderOption,
                phoneController: phoneController,
                emailController: emailController,
                newEmailController: newEmailController,
                editData: editData,
                isLoading: isLoading,
              );
            },
          ),
        ),
      ),
    );
  }
}
