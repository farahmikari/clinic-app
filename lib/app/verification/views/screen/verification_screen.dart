import 'dart:core';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_bloc.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_event.dart';
import 'package:clinic_app/app/user_drawer/views/screen/drawer_screen.dart';
import 'package:clinic_app/app/verification/controllers/bloc/timer_countdown_bloc/timer_countdown_bloc.dart';
import 'package:clinic_app/app/verification/controllers/bloc/verification_bloc/verification_bloc.dart';
import 'package:clinic_app/app/verification/controllers/bloc/verification_bloc/verification_event.dart';
import 'package:clinic_app/app/verification/model/verification_goto.dart';
import 'package:clinic_app/app/verification/views/widget/otp_textfield.dart';
import 'package:clinic_app/consts.dart';
import 'package:clinic_app/app/forget_password/views/screens/reset_password.dart';
import 'package:clinic_app/app/signup/views/screens/sign_up_screen.dart';
import 'package:clinic_app/app/login/views/widgets/button_widget.dart';
import 'package:clinic_app/app/signup/views/widgets/text_button_widget.dart';
import 'package:clinic_app/core/utils/snack_bar_util.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({required this.email, required this.source, super.key});
  final controllers = List.generate(6, (_) => TextEditingController());
  final String email;
  final dynamic source;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => VerificationBloc()),
        BlocProvider(
          create:
              (context) => TimerCountdownBloc()..add(StartTimer(seconds: 30)),
        ),
        BlocProvider(create: (context) => EmailBloc()),
      ],

      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocConsumer<VerificationBloc, VerificationState>(
            listener: (context, state)async {
              switch (state) {
                case VerificationSuccess():
                  showSnackBar(
                    context,
                    title: S.current.success,
                    message: S.current.verification_success,
                    contentType: ContentType.success,
                  );
                  await Future.delayed(Duration(seconds: 3));
                  switch (source) {
                    case VerificationGoto.signup:
                      Get.offAll(() => SignUp(email: email));
                      break;
                    case VerificationGoto.forgetPassword:
                      Get.offAll(
                        () => ResetPassword(
                          email: email,
                          code: state.emailModel!.code,
                        ),
                      );
                      break;
                    case VerificationGoto.changeEmail:
                      Get.offAll(() => DrawerScreen());
                      break;
                  }
                  break;
                case VerificationFailed():
                  showSnackBar(
                    context,
                    title: S.current.failed,
                    message: S.current.verification_failed,
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
                    S.current.otp_verification,
                    style: Theme.of(context).textTheme.titleLarge
                  ),
                  SizedBox(height: 8),
                  Text(
                    "${S.current.we_sent_your_code_to} $email ${S.current.this_code_will_expired_in}",
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
                          first: i == 0,
                          last: i == 5,
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 24),

                  MyButtonWidget(
                    text: S.current.submit,
                    color: kPrimaryColor,
                    isLoading: isLoading,
                    onPressed:
                        (state.canSubmit && !isLoading)
                            ? () {
                              context.read<VerificationBloc>().add(
                                CanSubmitVerificationEvent(
                                  emailModel: state.emailModel!,
                                  source: source,
                                ),
                              );
                            }
                            : null,
                  ),
                  SizedBox(height: height * 0.1),
                  BlocBuilder<TimerCountdownBloc, TimerCountdownState>(
                    builder: (context, state) {
                      final isCounting = state.isRunning;
                      final seconds = state.second;
                      return MyTextButton(
                        textButton:
                            isCounting
                                ? "0:${seconds.toString().padLeft(2, '0')}"
                                : S.current.resend_otp_code,
                        color: isCounting ? Colors.grey : kPrimaryColor,
                        onPressed:
                            isCounting
                                ? null
                                : () async {
                                  context.read<EmailBloc>().add(
                                    CanSubmitEmail(
                                      email: email,
                                      source: source,
                                    ),
                                  );
                                  context.read<TimerCountdownBloc>().add(
                                    StartTimer(seconds: 30),
                                  );
                                },
                      );
                    },
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
