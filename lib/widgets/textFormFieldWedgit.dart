import 'dart:math';

import 'package:clinic_app/consts.dart';
import 'package:flutter/material.dart';

class Textformfeildwedgit extends StatelessWidget {
  Textformfeildwedgit({
    required this.label,
    required this.iconTextField,
    required this.onChanged,
    this.error,
    this.controller,
    this.readOnly = false,
    this.validator,
    this.obscure = false,
    this.keyboardType,
    this.suffixIcon,
    this.onTap
  });
  final String label;
  final IconData iconTextField;
  final bool obscure;
  TextInputType? keyboardType;
  String? error;
  Function(String value)? onChanged;
  String? Function(String?)? validator;
  IconButton? suffixIcon;
  final TextEditingController? controller;
  void Function()? onTap;
  bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscure,
        onChanged: onChanged,
        onTap: onTap,
        readOnly: readOnly,
        style: Theme.of(context).textTheme.titleSmall,
        validator: validator,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          errorText: error,
          errorStyle: TextStyle(color: Colors.red),
          errorBorder: outlineBorder(color: Colors.red),
          focusedErrorBorder: outlineBorder(color: Colors.red),
          prefixIcon: Icon(iconTextField, color: kPrimaryColor),
          labelText: label,
          labelStyle: TextStyle(
            color: kPrimaryColor,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold,
          ),
          enabledBorder: outlineBorder(color: kUnfocsedColor),
          focusedBorder: outlineBorder(color: kPrimaryColor),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  OutlineInputBorder outlineBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(5),
    );
  }
}
