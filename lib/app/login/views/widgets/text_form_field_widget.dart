import 'package:clinic_app/consts.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.label,
    required this.iconTextField,
     this.onChanged,
    this.error,
    this.controller,
    this.readOnly = false,
    this.validator,
    this.obscure = false,
    this.keyboardType,
    this.suffixIcon,
    this.onTap,
  });
  final String label;
  final IconData iconTextField;
  final bool obscure;
  final TextInputType? keyboardType;
  final String? error;
  final Function(String value)? onChanged;
  final String? Function(String?)? validator;
  final IconButton? suffixIcon;
  final TextEditingController? controller;
  final void Function()? onTap;
  final bool readOnly;
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
