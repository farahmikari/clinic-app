import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clinic_app/app/edit_profile/controller/bloc/edit_passowrd_bloc/edit_password_bloc.dart';
import 'package:clinic_app/app/edit_profile/controller/bloc/edit_passowrd_bloc/edit_password_event.dart';
import 'package:clinic_app/app/edit_profile/controller/bloc/edit_passowrd_bloc/edit_password_state.dart';
import 'package:clinic_app/app/login/views/widgets/button_widget.dart';
import 'package:clinic_app/app/login/views/widgets/text_form_field_widget.dart';
import 'package:clinic_app/app/user_drawer/views/screen/drawer_screen.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:clinic_app/core/utils/snack_bar_util.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class EditPasswordScreen extends StatelessWidget {
  const EditPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool oldObscure = false;
    bool obscure = false;
    bool conObscure = false;
    final bloc = context.read<EditPasswordBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.change_password,
          style: TextStyle(
            color: Theme.of(context).primaryTextColor,
            fontSize: AppDimensions.lfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<EditPasswordBloc, EditPasswordBaseState>(
          listener: (context, state) async {
            switch (state) {
              case EditPasswordSuccess():
                showSnackBar(
                  context,
                  title: S.current.success,
                  message: S.current.edit_password_successfully,
                  contentType: ContentType.success,
                );
                await await Future.delayed(Duration(seconds: 2));
                Get.off(() => DrawerScreen());
                break;

              case EditPasswordFailed():
                showSnackBar(
                  context,
                  title: S.current.failed,
                  message: S.current.failed_changed_password,
                  contentType: ContentType.failure,
                );
                break;
              default:
                break;
            }
          },
          builder: (context, state) {
            final data = state.data;
            final bool isLoading = state is EditPasswordLoading;
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
                    label: S.current.old_password,
                    iconTextField: Icons.lock,
                    onChanged: (value) {
                      bloc.add(OldPasswordEvent(password: value));
                      bloc.add(EditButtonEvent());
                    },
                    error: data.oldPassword.error,
                    validator: (value) => data.oldPassword.error,
                    obscure: oldObscure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        oldObscure = !oldObscure;
                        bloc.add(OldObscurEvent(obscure: !obscure));
                      },
                      icon: Icon(
                        oldObscure ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).accentTextColor,
                      ),
                    ),
                  ),
                  /////////////////new password////////////////
                  SizedBox(height: 1.0.hp),

                  TextFormFieldWidget(
                    label: S.current.new_password,
                    iconTextField: Icons.lock,
                    onChanged: (value) {
                      bloc.add(PasswordEvent(password: value));
                      bloc.add(EditButtonEvent());
                    },
                    error: data.password.error,
                    validator: (value) => data.password.error,
                    obscure: obscure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        obscure = !obscure;
                        bloc.add(ObscurEvent(obscure: !obscure));
                      },
                      icon: Icon(
                        obscure ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).accentTextColor,
                      ),
                    ),
                  ),
                  ////////////////confirm password//////////////
                  SizedBox(height: 1.0.hp),
                  TextFormFieldWidget(
                    label: S.current.confirm_password,
                    iconTextField: Icons.lock,
                    onChanged: (value) {
                      bloc.add(ConPasswordEvent(password: value));
                      bloc.add(EditButtonEvent());
                    },
                    error: data.conPassword.error,
                    validator: (value) => data.conPassword.error,
                    obscure: conObscure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        conObscure = !conObscure;
                        bloc.add(ConObscurEvent(obscure: !conObscure));
                      },
                      icon: Icon(
                        conObscure ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).accentTextColor,
                      ),
                    ),
                  ),
                  //////////////////////////button change password///////////
                  SizedBox(height: 5.0.hp),
                  MyButtonWidget(
                    text: S.current.change_password,
                    isLoading: isLoading,
                    onPressed:
                        (data.buttonEvent && !isLoading)
                            ? () {
                              bloc.add(EditSubmitEvent());
                            }
                            : null,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
