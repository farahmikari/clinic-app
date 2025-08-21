import 'package:clinic_app/app/edit_profile/controller/bloc/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:clinic_app/app/edit_profile/controller/bloc/edit_profile_bloc/edit_profile_event.dart';
import 'package:clinic_app/app/edit_profile/views/widgets/email_edit_widget.dart';
import 'package:clinic_app/app/login/views/widgets/button_widget.dart';
import 'package:clinic_app/app/login/views/widgets/text_form_field_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/utils/select_birthday_date.dart';
import 'package:clinic_app/core/utils/select_gender.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoEditWidget extends StatelessWidget {
  const InfoEditWidget({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.birthdayController,
    required this.valueBirth,
    required this.genderController,
    required this.genderOption,
    required this.phoneController,
    required this.emailController,
    required this.newEmailController,
    required this.editData,
    required this.isLoading,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController birthdayController;
  final String? valueBirth;
  final TextEditingController genderController;
  final List<String> genderOption;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController newEmailController;
  final EditProfileState editData;
  final bool isLoading;
  
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProfileBloc>();
    return Form(
      key: editData.formKey,
      child: Column(
        children: [
          TextFormFieldWidget(
            label: S.current.first_name,
            iconTextField: Icons.person_outline,
            controller: firstNameController,
            validator: (value) => editData.firstName.value,
            error: editData.firstName.error,
            onChanged: (value) {
              bloc.add(EditFirstNameFieldEvent(name: value));
              bloc.add(EditButtonEvent());
            },
          ),
          TextFormFieldWidget(
            label: S.current.last_name ,
            iconTextField: Icons.person_outlined,
            controller: lastNameController,
            validator: (value) => editData.lastName.value,
            error: editData.lastName.error,
            onChanged: (value) {
              bloc.add(EditLastNameFieldEvent(name: value));
              bloc.add(EditButtonEvent());
            },
          ),
          TextFormFieldWidget(
            label:  S.current.birthday_date,
            iconTextField: Icons.person_outline,
            controller: birthdayController,
            suffixIcon: IconButton(
              onPressed:
                  () =>
                      selectDate(context, valueBirth, birthdayController, bloc),
              icon: Icon(Icons.calendar_month_outlined),
            ),
            readOnly: true,
          ),
          TextFormFieldWidget(
            label:  S.current.gender,
            iconTextField: Icons.transgender,
            controller: genderController,
            onTap:
                () =>
                    selectGender(context, genderOption, genderController, bloc),
            readOnly: true,
          ),
          TextFormFieldWidget(
            label:  S.current.phone,
            iconTextField: Icons.phone_android_outlined,
            controller: phoneController,
            validator: (value) => editData.phone.value,
            error: editData.phone.error,
            onChanged: (value) {
              bloc.add(EditPhoneFieldEvent(phone: value));
              bloc.add(EditButtonEvent());
            },
            keyboardType: TextInputType.numberWithOptions(),
          ),
          EmailEditWidget(
            emailController: emailController,
            newEmailController: newEmailController,
          ),
          SizedBox(height: 0.2.hp),
          MyButtonWidget(
            text: S.current.save,
            color: AppColors.primaryColor,
            isLoading: isLoading,
            onPressed:
                (editData.buttonEvent && !isLoading)
                    ? () {
                      bloc.add(EditSubmitEvent());
                    }
                    : null,
          ),
        ],
      ),
    );
  }
}