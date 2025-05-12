import 'package:animated_background/animated_background.dart';
import 'package:clinic_app/consts.dart';
import 'package:clinic_app/bloc/login_bloc/login_bloc_bloc.dart';
import 'package:clinic_app/screens/auth_screens/forget_pasword_screens/set_email_screen.dart';
import 'package:clinic_app/screens/auth_screens/sign_up_screen/number_screen.dart';
import 'package:clinic_app/widgets/MyTextButton.dart';
import 'package:clinic_app/widgets/myButtonWidget.dart';
import 'package:clinic_app/widgets/textFormFieldWedgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = "Login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    bool _obscure = false;
    final width = size.width;
    final height = size.height;

    return BlocProvider(
      create: (context) => LoginBlocBloc(),
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
            child: BlocBuilder<LoginBlocBloc, LoginBlocState>(
              builder: (context, state) {
                return Form(
                  key: state.formKey,
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
                          color: Colors.white,
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
                                  padding: EdgeInsets.only(
                                    top: 10.0,
                                    left: width * 0.05,
                                  ),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: "Montserat",
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10.0,
                                    left: width * 0.05,
                                  ),
                                  child: Text(
                                    " Welcome Back !",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Lato",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Textformfeildwedgit(
                                  label: 'Phone',
                                  iconTextField: Icons.phone,
                                  onChanged: (value) {
                                    context.read<LoginBlocBloc>().add(
                                      PhoneFieldEvent(phone: value),
                                    );
                                    context.read<LoginBlocBloc>().add(
                                      ButtonEvent(),
                                    );
                                    // print("errorrrrrr");
                                  },
                                  validator: (value) => state.phone.error,
                                  error: state.phone.error,
                                  keyboardType: TextInputType.phone,
                                ),
                                Textformfeildwedgit(
                                  label: 'Password',
                                  iconTextField: Icons.key,
                                  onChanged: (value) {
                                    context.read<LoginBlocBloc>().add(
                                      PasswordFieldEvent(password: value),
                                    );
                                    context.read<LoginBlocBloc>().add(
                                      ButtonEvent(),
                                    );
                                  },
                                  validator: (value) => state.password.error,
                                  error: state.password.error,
                                  obscure: _obscure,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      _obscure = !_obscure;
                                      context.read<LoginBlocBloc>().add(
                                        ObscureEvent(obscure: _obscure),
                                      );
                                    },
                                    icon: Icon(
                                      _obscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.55),
                                  child: Mytextbutton(
                                    textButton: 'Forget password ? ',
                                    color: Colors.grey,
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        SetEmailScreen.id,
                                      );
                                    },
                                  ),
                                ),
                                Mybuttonwidget(
                                  text: 'Login',
                                  color: kPrimaryColor,
                                  onPressed: state.button ? () {} : null,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Don\'t have an account ? ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Mytextbutton(
                                      textButton: 'sign up ',
                                      color: kPrimaryColor,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          NumberScreen.id,
                                        );
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
