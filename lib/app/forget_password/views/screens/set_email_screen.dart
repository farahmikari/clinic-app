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
      create: (context) => EmailBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
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
                      'verification': emailController.text,
                      'sign': false,
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
                    TextFormFieldWidget(
                      label: 'Email',
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
                      text: 'Verify',
                      isLoading:isLoading ,
                      onPressed:
                          (state.canSubmit && !isLoading)
                              ? () {
                                
                                context.read<EmailBloc>().add(
                                  CanSubmitEmail(email: emailController.text,signUp: false),
                                );
                              }
                              : null,
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
