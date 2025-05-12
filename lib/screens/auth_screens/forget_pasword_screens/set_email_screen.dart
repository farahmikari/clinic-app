import 'package:clinic_app/bloc/forget_password_bloc/forget_password_bloc.dart';
import 'package:clinic_app/consts.dart';
import 'package:clinic_app/screens/auth_screens/sign_up_screen/verification_screen.dart';
import 'package:clinic_app/widgets/myButtonWidget.dart';
import 'package:clinic_app/widgets/textFormFieldWedgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetEmailScreen extends StatelessWidget {
  SetEmailScreen({super.key});
  static String id = "Set Email";
  final TextEditingController emailController = TextEditingController();
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
              return Form(
                key: state.formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Image.asset(
                      "assets/images/Forgot password.png",
                      width: width,
                      height: height * 0.4,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Set Your Email',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                
                    SizedBox(height: height * 0.1),
                    Textformfeildwedgit(
                      label: 'Email',
                      controller: emailController,
                      iconTextField: Icons.email,
                      onChanged: (value) {
                            context.read<ForgetPasswordBloc>().add(
                              FEmailFieldEvent(email: value),
                            );
                            context.read<ForgetPasswordBloc>().add(FEmailButtonEvent());
                            // print("errorrrrrr");
                          },
                          error: state.email.error,
                          validator: (value) => state.email.error,
                    ),
                    Mybuttonwidget(
                      text: 'Verify',
                      onPressed:state.buttonEmail? () {
                        Navigator.pushNamed(
                          context,
                          VerificationScreen.id,
                          arguments: <String, dynamic>{
                            'verification': emailController.text,
                            'sign': false,
                          },
                        );
                      }:null,
                      color: kPrimaryColor,
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
