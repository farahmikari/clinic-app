import 'package:clinic_app/bloc/forget_password_bloc/forget_password_bloc.dart';
import 'package:clinic_app/consts.dart';
import 'package:clinic_app/widgets/myButtonWidget.dart';
import 'package:clinic_app/widgets/textFormFieldWedgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  static String id = "Reset Password";
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return BlocProvider(
      create: (context) => ForgetPasswordBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
            builder: (context, state) {
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
                  Textformfeildwedgit(
                    label: 'password',
                    iconTextField: Icons.key,
                    error: state.password.error,
                    validator: (value) => state.password.error,
                    onChanged: (value) {
                      context.read<ForgetPasswordBloc>().add(
                        FPasswordFieldEvent(password: value),
                      );
                      context.read<ForgetPasswordBloc>().add(FButtonEvent());
                    },
                  ),
                  Textformfeildwedgit(
                    label: 'confirm password',
                    iconTextField: Icons.key,
                    error: state.conPassword.error,
                    validator: (value) => state.conPassword.error,
                    onChanged: (value) {
                      context.read<ForgetPasswordBloc>().add(
                        FConPasswordFieldEvent(password: value),
                      );
                      context.read<ForgetPasswordBloc>().add(FButtonEvent());
                    },
                  ),
                  Mybuttonwidget(
                    text: 'Reset Password',
                    onPressed:state.button? () {}:null,
                    color: kPrimaryColor,
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
