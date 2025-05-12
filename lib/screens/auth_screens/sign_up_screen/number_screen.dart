import 'package:animated_background/animated_background.dart';
import 'package:clinic_app/bloc/signup_bloc/signup_bloc.dart';
import 'package:clinic_app/consts.dart';
import 'package:clinic_app/screens/auth_screens/sign_up_screen/verification_screen.dart';
import 'package:clinic_app/widgets/my_button_widget.dart';
import 'package:clinic_app/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberScreen extends StatefulWidget {
  NumberScreen({super.key});
  static String id = "Number";
  final TextEditingController phoneController = TextEditingController();
  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return BlocProvider(
      create: (context) => SignupBloc(),
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
            child: BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) {
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
                                    label: 'Phone',
                                    iconTextField: Icons.phone,
                                    onChanged: (value) {
                                      context.read<SignupBloc>().add(
                                        SPhoneFieldEvent(phone: value),
                                      );
                                      context.read<SignupBloc>().add(
                                        SButtonVerifyEvent(),
                                      );
                                      // print("errorrrrrr");
                                    },
                                    validator: (value) => state.phone.error,
                                    error: state.phone.error,
                                    keyboardType: TextInputType.phone,
                                  ),

                                  MyButtonWidget(
                                    text: 'Verify',
                                    color: kPrimaryColor,
                                    onPressed:
                                        state.buttonVerify
                                            ? () {
                                              Navigator.pushNamed(
                                                context,
                                                VerificationScreen.id,
                                                arguments: <String, dynamic>{
                                                  'verification':
                                                      widget
                                                          .phoneController
                                                          .text,
                                                  'sign': true,
                                                },
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
