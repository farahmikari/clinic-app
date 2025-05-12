import 'dart:core';

import 'package:clinic_app/consts.dart';
import 'package:clinic_app/screens/auth_screens/forget_pasword_screens/reset_password.dart';
import 'package:clinic_app/screens/auth_screens/sign_up_screen/sign_up_screen.dart';
import 'package:clinic_app/widgets/MyTextButton.dart';
import 'package:clinic_app/widgets/myButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});
  static String id = "verify";
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final map =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    final String phone = map['verification'];
    final bool push = map['sign'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
              "We sent your code to $phone\nThis code will expired in 00:30",
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
                children: [
                  OTPForm(),
                  OTPForm(),
                  OTPForm(),
                  OTPForm(),
                  OTPForm(),
                ],
              ),
            ),
            SizedBox(height: 24),
            Mybuttonwidget(
              text: "Submit",
              onPressed: () {
                push
                    ? Navigator.pushNamed(context, SignUp.id)
                    : Navigator.pushNamed(context, ResetPassword.id);
                print(push);
              },
              color: kPrimaryColor,
            ),
            SizedBox(height: height * 0.1),
            Mytextbutton(
              textButton: "Resend OTP Code",
              color: Colors.grey,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class OTPForm extends StatelessWidget {
  const OTPForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 64,
      child: TextFormField(
        onSaved: (pin) {},
        onChanged: (pin) {
          if (pin.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
        },
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: kUnfocsedColor),
          border: authOutlineInputBorder,
          enabledBorder: authOutlineInputBorder,
          focusedBorder: authOutlineInputBorder.copyWith(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kUnfocsedColor),
  borderRadius: BorderRadius.all(Radius.circular(5)),
);
