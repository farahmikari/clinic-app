import 'package:animated_background/animated_background.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clinic_app/app/login/models/form_model.dart';
import 'package:clinic_app/app/login/views/screens/login_screen.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_bloc.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_event.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_state.dart';
import 'package:clinic_app/app/verification/model/verification_goto.dart';
import 'package:clinic_app/app/verification/views/screen/verification_screen.dart';
import 'package:clinic_app/app/login/views/widgets/button_widget.dart';
import 'package:clinic_app/app/login/views/widgets/text_form_field_widget.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/utils/snack_bar_util.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class EmailScreen extends StatefulWidget {
  EmailScreen({super.key});
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
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedBackground(
          vsync: this,
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
              baseColor: Theme.of(context).foregroundColor,
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
                      title: S.current.success,
                      message: S.current.verify_code_is_sent_successfully,
                      contentType: ContentType.success,
                    );
                    Get.to(
                      () => VerificationScreen(
                        email: widget.emailController.text,
                        source: VerificationGoto.signup,
                      ),
                    );
                    break;
                  case EmailFailed():
                    showSnackBar(
                      context,
                      title: S.current.failed,
                      message: S.current.failed_to_send_verify_code,
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
                          color: Theme.of(context).primaryBackgroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: height * 0.1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                  start: width * 0.05,
                                ),
                                child: Text(
                                  S.current.glad_to_see_you,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              TextFormFieldWidget(
                                label: S.current.email,
                                controller: widget.emailController,
                                iconTextField: Icons.email,
                                onChanged: (value) {
                                  context.read<EmailBloc>().add(
                                    InitEmailEvent(email: value),
                                  );
                                },
                                validator: (value) => emailState.email.error,
                                error: emailState.email.error,
                              ),
                              MyButtonWidget(
                                text: S.current.verify,
                                color: Theme.of(context).primaryColor,
                                isLoading: isLoading,
                                onPressed:
                                    (state.canSubmit && !isLoading)
                                        ? () {
                                          context.read<EmailBloc>().add(
                                            CanSubmitEmail(
                                              email:
                                                  widget.emailController.text,
                                              source: VerificationGoto.signup,
                                            ),
                                          );
                                        }
                                        : null,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.current.do_you_have_an_account,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.off(() => LoginScreen());
                                    },
                                    child: Text(
                                      S.current.login,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
