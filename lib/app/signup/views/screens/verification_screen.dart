import 'dart:core';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clinic_app/app/signup/controllers/bloc/verification_bloc/verification_bloc.dart';
import 'package:clinic_app/app/signup/controllers/bloc/verification_bloc/verification_event.dart';
import 'package:clinic_app/app/signup/views/widgets/otp_textfield.dart';
import 'package:clinic_app/consts.dart';
import 'package:clinic_app/app/forget_password/views/screens/reset_password.dart';
import 'package:clinic_app/app/signup/views/screens/sign_up_screen.dart';
import 'package:clinic_app/app/login/views/widgets/button_widget.dart';
import 'package:clinic_app/app/signup/views/widgets/text_button_widget.dart';
import 'package:clinic_app/core/utils/snack_bar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});
  static String id = "verify";
  final controllers = List.generate(6, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final map =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    final String email = map['verification'];
    final bool push = map['sign'];

    return BlocProvider(
      create: (context) => VerificationBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: BlocConsumer<VerificationBloc, VerificationState>(
            listener: (context, state) {
              
              switch (state) {
                
                case VerificationSuccess():
                  showSnackBar(
                    context,
                    title: "Success",
                    message: "Verification Successfully",
                    contentType: ContentType.success,
                  );
                  push
                      ? Navigator.pushNamed(
                        context,
                        SignUp.id,
                        arguments: email,
                      )
                      : Navigator.pushNamed(context, ResetPassword.id,
                      arguments:<String, String>{
                      'email': email,
                      'code': state.emailModel!.code,
                    }, );
                  break;
                case VerificationFailed():
                  showSnackBar(
                    context,
                    title: "Failed",
                    message: "Verification Failed ",
                    contentType: ContentType.failure,
                  );
                  break;
                default:
                  break;
              }
            },
            builder: (context, state) {
              final bool isLoading = state is VerificationLoading;
              return Column(
                children: [
                  SizedBox(height: 20),
                  Image.asset(
                    "assets/images/verification.png",
                    width: width,
                    height: height * 0.4,
                  ),
                  Text(
                    "OTP Verfication",
                    style: TextStyle(
                      fontFamily: "Montserat",
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "We sent your code to $email\nThis code will expired in 05:00",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontFamily: "Montserat",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.1),
                  Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(6, (i) {
                        return OTPForm(
                          controller: controllers[i],
                          onChanged: (pin) {
                            context.read<VerificationBloc>().add(
                              OtpChangedEvent(
                                index: i,
                                value: pin,
                                email: email,
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 24),

                  MyButtonWidget(
                    text: "Submit",
                    color: kPrimaryColor,
                    isLoading: isLoading,
                    onPressed:
                        (state.canSubmit && !isLoading)
                            ? () {
                              state.signUp = push;
                              context.read<VerificationBloc>().add(
                                CanSubmitVerificationEvent(
                                  emailModel: state.emailModel!,
                                  signUp: push
                                ),
                              );
                            }
                            : null,
                  ),
                  SizedBox(height: height * 0.1),
                  MyTextButton(
                    textButton: "Resend OTP Code",
                    color: Colors.grey,
                    onPressed: () {},
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
