import 'package:clinic_app/app/edit_profile/controller/bloc/edit_bloc/edit_password_bloc.dart';
import 'package:clinic_app/app/edit_profile/controller/bloc/edit_bloc/edit_password_event.dart';
import 'package:clinic_app/app/edit_profile/controller/bloc/edit_bloc/edit_password_state.dart';
import 'package:clinic_app/app/login/views/widgets/button_widget.dart';
import 'package:clinic_app/app/login/views/widgets/text_form_field_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPasswordScreen extends StatelessWidget {
  const EditPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool oldObscure = false;
    bool obscure = false;
    bool conObscure = false;
    return BlocProvider(
      create: (context) => EditPasswordBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "change passsword",
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: AppColors.backgroundColor),
          ),
          actionsIconTheme: IconThemeData(color: AppColors.backgroundColor),
        ),
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: BlocBuilder<EditPasswordBloc, EditPasswordBaseState>(
           
            builder: (context, state) {
              final data = state.data;
              return Form(
                key: data.formKey,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/Reset password-rafiki.png",
                      width: 60.0.wp,
                      height: 30.0.hp,
                    ),
                    SizedBox(height: 5.0.hp),
                    //////////////////old password///////////////
                    TextFormFieldWidget(
                      label: 'old password',
                      iconTextField: Icons.lock,
                      onChanged: (value) {
                        context.read<EditPasswordBloc>().add(
                          OldPasswordEvent(password: value),
                        );
                        context.read<EditPasswordBloc>().add(EditButtonEvent());
                      },
                      error: data.oldPassword.error,
                      validator: (value) => data.oldPassword.error,
                      obscure: oldObscure,
                      suffixIcon: IconButton(
                        onPressed: () {
                          oldObscure = !oldObscure;
                          context.read<EditPasswordBloc>().add(
                            OldObscurEvent(obscure: !obscure),
                          );
                        },
                        icon: Icon(oldObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,),
                      ),
                    ),
                  /////////////////new password////////////////  
                    SizedBox(height: 1.0.hp),

                    TextFormFieldWidget(
                      label: 'new password',
                      iconTextField: Icons.lock,
                       onChanged: (value) {
                        context.read<EditPasswordBloc>().add(
                          PasswordEvent(password: value),
                        );
                        context.read<EditPasswordBloc>().add(EditButtonEvent());
                      },
                       error: data.password.error,
                      validator: (value) => data.password.error,
                      obscure: obscure,
                      suffixIcon: IconButton(
                        onPressed: () {
                          obscure = !obscure;
                          context.read<EditPasswordBloc>().add(
                            ObscurEvent(obscure: !obscure),
                          );
                        },
                        icon: Icon(obscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,),
                      ),
                    ),
                    ////////////////confirm password//////////////
                    SizedBox(height: 1.0.hp),
                    TextFormFieldWidget(
                      label: 'confirm password',
                      iconTextField: Icons.lock,
                       onChanged: (value) {
                        context.read<EditPasswordBloc>().add(
                          ConPasswordEvent(password: value),
                        );
                        context.read<EditPasswordBloc>().add(EditButtonEvent());
                      },
                      error: data.conPassword.error,
                      validator: (value) => data.conPassword.error,
                      obscure: conObscure,
                      suffixIcon: IconButton(
                        onPressed: () {
                          conObscure = !conObscure;
                          context.read<EditPasswordBloc>().add(
                            ConObscurEvent(obscure: !conObscure),
                          );
                        },
                        icon: Icon(conObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,),
                      ),
                    ),
                  //////////////////////////button change password///////////  
                    SizedBox(height: 5.0.hp),
                    MyButtonWidget(
                      text: "change password",
                      onPressed: () {},
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
