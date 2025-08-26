import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clinic_app/app/login/models/form_model.dart';
import 'package:clinic_app/app/login/views/widgets/text_form_field_widget.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_bloc.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_event.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_state.dart';
import 'package:clinic_app/app/verification/model/verification_goto.dart';
import 'package:clinic_app/app/verification/views/screen/verification_screen.dart';
import 'package:clinic_app/app/login/views/widgets/button_widget.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/utils/snack_bar_util.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SetEmailScreen extends StatelessWidget {
  SetEmailScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return BlocProvider(
      create: (context) => EmailBloc(),
      child: Scaffold(
        body: SingleChildScrollView(
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
                      email: emailController.text,
                      source: VerificationGoto.forgetPassword,
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
                    SizedBox(height: 20),
                    Image.asset(
                      "assets/images/Forgot password.png",
                      width: width,
                      height: height * 0.4,
                    ),
                    SizedBox(height: 20),
                    Text(
                      S.current.set_your_email,
                      style: TextStyle(
                        color: Theme.of(context).primaryTextColor,
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: height * 0.1),
                    TextFormFieldWidget(
                      label: S.current.email,
                      controller: emailController,
                      iconTextField: Icons.email,
                      onChanged: (value) {
                        context.read<EmailBloc>().add(
                          InitEmailEvent(email: value),
                        );
                      },
                      error: emailState.email.error,
                      validator: (value) => emailState.email.error,
                    ),
                    MyButtonWidget(
                      text: S.current.verify,
                      isLoading: isLoading,
                      onPressed:
                          (state.canSubmit && !isLoading)
                              ? () {
                                context.read<EmailBloc>().add(
                                  CanSubmitEmail(
                                    email: emailController.text,
                                    source: VerificationGoto.forgetPassword,
                                  ),
                                );
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
      ),
    );
  }
}
