import 'package:animated_background/animated_background.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clinic_app/app/forget_password/views/screens/set_email_screen.dart';
import 'package:clinic_app/app/login/controllers/login_bloc/login_bloc.dart';
import 'package:clinic_app/app/login/views/widgets/button_widget.dart';
import 'package:clinic_app/app/login/views/widgets/text_form_field_widget.dart';
import 'package:clinic_app/app/signup/views/screens/email_screen.dart';
import 'package:clinic_app/app/signup/views/widgets/text_button_widget.dart';
import 'package:clinic_app/app/user_drawer/views/screen/drawer_screen.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/utils/snack_bar_util.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    bool obscure = false;
    final width = size.width;

    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => LoginBlocBloc())],

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
            child: BlocConsumer<LoginBlocBloc, LoginBaseState>(
              listener: (context, state) async {
                switch (state) {
                  case LoginSuccess():
                    showSnackBar(
                      context,
                      title: S.current.success,
                      message: S.current.login_successfully,
                      contentType: ContentType.success,
                    );
                    await Future.delayed(Duration(seconds: 2));
                    Get.offAll(() => DrawerScreen());
                    break;
                  case LoginFailed():
                    showSnackBar(
                      context,
                      title: S.current.failed,
                      message: S.current.login_failed,
                      contentType: ContentType.failure,
                    );
                    break;
                  default:
                    break;
                }
              },
              builder: (context, state) {
                final loginData = state.data;
                final bool isLoading = state is LoginLoading;

                return Form(
                  key: loginData.formKey,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Health professional team-amico.png',
                        height: size.height * 0.3,
                        width: size.width,
                      ),
                      Container(
                        height: size.height * 0.7,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryBackgroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    top: 10.0,
                                    start: width * 0.05,
                                  ),
                                  child: Text(
                                    S.current.login,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    top: 10.0,
                                    start: width * 0.05,
                                  ),
                                  child: Text(
                                    S.current.welcom_back,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryTextColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormFieldWidget(
                                  label: S.current.email,
                                  iconTextField: Icons.email,
                                  onChanged: (value) {
                                    context.read<LoginBlocBloc>().add(
                                      EmailFieldEvent(email: value),
                                    );
                                    context.read<LoginBlocBloc>().add(
                                      ButtonEvent(),
                                    );
                                  },
                                  validator: (value) => loginData.email.error,
                                  error: loginData.email.error,
                                ),
                                TextFormFieldWidget(
                                  label: S.current.password,
                                  iconTextField: Icons.key,
                                  onChanged: (value) {
                                    context.read<LoginBlocBloc>().add(
                                      PasswordFieldEvent(password: value),
                                    );
                                    context.read<LoginBlocBloc>().add(
                                      ButtonEvent(),
                                    );
                                  },
                                  validator:
                                      (value) => loginData.password.error,
                                  error: loginData.password.error,
                                  obscure: obscure,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      obscure = !obscure;
                                      context.read<LoginBlocBloc>().add(
                                        ObscureEvent(obscure: obscure),
                                      );
                                    },
                                    icon: Icon(
                                      color: Theme.of(context).accentTextColor,
                                      obscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    start: width * 0.55,
                                  ),
                                  child: MyTextButton(
                                    textButton: S.current.forget_password,
                                    color: Theme.of(context).hintTextColor,
                                    onPressed: () {
                                      Get.to(() => SetEmailScreen());
                                    },
                                  ),
                                ),
                                MyButtonWidget(
                                  text: S.current.login,
                                  color: Theme.of(context).primaryColor,
                                  isLoading: isLoading,
                                  onPressed:
                                      (loginData.button && !isLoading)
                                          ? () {
                                            context.read<LoginBlocBloc>().add(
                                              LoginSubmitEvent(),
                                            );
                                          }
                                          : null,
                                ),
                                MyButtonWidget(
                                  text: S.current.continue_as_a_guest,
                                  onPressed: () {
                                    Get.offAll(() => DrawerScreen());
                                  },
                                  color: Theme.of(context).primaryColor,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      S.current.dont_have_an_account,
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).primaryTextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    MyTextButton(
                                      textButton: S.current.sign_up,
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        Get.off(() => EmailScreen());
                                      },
                                    ),
                                  ],
                                ),
                              ],
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
