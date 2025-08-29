import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
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
        style: TextStyle(
          color: Theme.of(context).primaryTextColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        validator: validator,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          errorText: error,
          errorStyle: TextStyle(color: Theme.of(context).errorColor),
          errorBorder: outlineBorder(color: Theme.of(context).errorColor),
          focusedErrorBorder: outlineBorder(
            color: Theme.of(context).errorColor,
          ),
          prefixIcon: Icon(
            iconTextField,
            color: Theme.of(context).primaryColor,
          ),
          labelText: label,
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: outlineBorder(color: Theme.of(context).borderColor),
          focusedBorder: outlineBorder(color: Theme.of(context).primaryColor),
          fillColor: Theme.of(context).accentBackgroundColor,
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
