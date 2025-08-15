import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clinic_app/app/forget_password/controllers/bloc/forget_password_bloc/forget_password_bloc.dart';
import 'package:clinic_app/app/login/views/screens/login_screen.dart';
import 'package:clinic_app/consts.dart';
import 'package:clinic_app/app/login/views/widgets/button_widget.dart';
import 'package:clinic_app/app/login/views/widgets/text_form_field_widget.dart';
import 'package:clinic_app/core/utils/snack_bar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email, required this.code});
  final String email;
  final String code;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    bool obscure = false;
    bool conObscure = false;
    // final map =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // final String email = map['email'];
    // final String code = map['code'];
    return BlocProvider(
      create: (context) => ForgetPasswordBloc(),
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordBaseState>(
            listener: (context, state) {
              switch (state) {
                case ForgetPasswordSuccess():
                  showSnackBar(
                    context,
                    title: "Success",
                    message: "Reset password Successfully",
                    contentType: ContentType.success,
                  );
                  Navigator.pushNamed(context, LoginScreen.id);
                  break;
                case ForgetPasswordFailed():
                  showSnackBar(
                    context,
                    title: "Failed",
                    message: "Reset password Failed",
                    contentType: ContentType.failure,
                  );
                  break;
                default:
                  break;
              }
            },

            builder: (context, state) {
              final resetData = state.data;
              final bool isLoading = state is ForgetPasswordLoading;

              return Column(
                children: [
                  SizedBox(height: 20),
                  Image.asset(
                    "assets/images/Forgot password.png",
                    width: width,
                    height: height * 0.4,
                  ),
                  SizedBox(height: height * 0.1),
                  Text(
                    "Reset Password",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: height * 0.05),
                  TextFormFieldWidget(
                    label: 'password',
                    iconTextField: Icons.key,
                    error: resetData.password.error,
                    validator: (value) => resetData.password.error,
                    onChanged: (value) {
                      context.read<ForgetPasswordBloc>().add(
                        FPasswordFieldEvent(password: value),
                      );
                      context.read<ForgetPasswordBloc>().add(FButtonEvent());
                    },
                    obscure: obscure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        obscure = !obscure;
                        context.read<ForgetPasswordBloc>().add(
                          FObscureEvent(obscure: obscure),
                        );
                      },
                      icon: Icon(
                        obscure ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  TextFormFieldWidget(
                    label: 'confirm password',
                    iconTextField: Icons.key,
                    error: resetData.conPassword.error,
                    validator: (value) => resetData.conPassword.error,
                    onChanged: (value) {
                      context.read<ForgetPasswordBloc>().add(
                        FConPasswordFieldEvent(password: value),
                      );
                      context.read<ForgetPasswordBloc>().add(FButtonEvent());
                    },
                    obscure: conObscure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        conObscure = !conObscure;
                        context.read<ForgetPasswordBloc>().add(
                          FConObscureEvent(conObscure: conObscure),
                        );
                      },
                      icon: Icon(
                        conObscure ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  MyButtonWidget(
                    text: 'Reset Password',
                    color: kPrimaryColor,
                    isLoading: isLoading,
                    onPressed:
                        (resetData.button && !isLoading)
                            ? () {
                              context.read<ForgetPasswordBloc>().add(
                                ForgetSubmitEvent(email: email, code: code),
                              );
                            }
                            : null,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
