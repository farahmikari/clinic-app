import 'package:animated_background/animated_background.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clinic_app/app/login/models/form_model.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_bloc.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_event.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_state.dart';
import 'package:clinic_app/consts.dart';
import 'package:clinic_app/app/verification/views/screen/verification_screen.dart';
import 'package:clinic_app/app/login/views/widgets/button_widget.dart';
import 'package:clinic_app/app/login/views/widgets/text_form_field_widget.dart';
import 'package:clinic_app/core/utils/snack_bar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailScreen extends StatefulWidget {
  EmailScreen({super.key});
  static String id = "Number";
  final TextEditingController emailController = TextEditingController();
  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return BlocProvider(
      create: (context) => EmailBloc(),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: AnimatedBackground(
          vsync: this,
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
              baseColor: Colors.white,
              spawnMaxRadius: 40,
              spawnMinSpeed: 15,
              particleCount: 30,
              spawnMaxSpeed: 100,
              spawnOpacity: 0.2,
            ),
          ),
          child: SingleChildScrollView(
            child: BlocConsumer<EmailBloc, EmailState>(
              listener: (context, state) {
                switch (state) {
                  case EmailSuccess():
                    showSnackBar(
                      context,
                      title: "Success",
                      message: "Verify code is sent Successfully",
                      contentType: ContentType.success,
                    );
                    Navigator.pushNamed(
                      context,
                      VerificationScreen.id,
                      arguments: <String, dynamic>{
                        'verification': widget.emailController.text,
                        'sign': true,
                      },
                    );
                    break;
                  case EmailFailed():
                    showSnackBar(
                      context,
                      title: "Failed",
                      message: "Failed to send verify code",
                      contentType: ContentType.failure,
                    );
                    break;
                  default:
                    break;
                }
              },
              builder: (context, state) {
                final emailState =
                    state is EmailInitial
                        ? state
                        : EmailInitial(email: FormModelItem());
                final bool isLoading = state is EmailLoading;

                return Form(
                  key: state.formKey,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/login.png',
                        height: height * 0.4,
                        width: width * 0.8,
                      ),
                      Container(
                        height: height * 0.6,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),

                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: width * 0.20,
                                    ),
                                    child: Text(
                                      "Glad to see you :)",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontFamily: "Montserat",
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  TextFormFieldWidget(
                                    label: 'Email',
                                    controller: widget.emailController,
                                    iconTextField: Icons.email,
                                    onChanged: (value) {
                                      context.read<EmailBloc>().add(
                                        InitEmailEvent(email: value),
                                      );
                                    },
                                    validator:
                                        (value) => emailState.email.error,
                                    error: emailState.email.error,
                                  ),

                                  MyButtonWidget(
                                    text: 'Verify',
                                    color: kPrimaryColor,
                                    isLoading: isLoading,
                                    onPressed:
                                        (state.canSubmit && !isLoading)
                                            ? () {
                                             
                                              context.read<EmailBloc>().add(
                                                CanSubmitEmail(
                                                  email:
                                                      widget
                                                          .emailController
                                                          .text,
                                                          signUp: true
                                                ),
                                              );
                                              
                                            }
                                            : null,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Do you have an account ? ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'login ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: kPrimaryColor,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  
}
