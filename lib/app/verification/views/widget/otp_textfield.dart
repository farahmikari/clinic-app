import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPForm extends StatelessWidget {
  const OTPForm({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.first,
    required this.last,
  });
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final bool first;
  final bool last;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 50,
      child: TextFormField(
        controller: controller,
        onSaved: (pin) {},
        onChanged: (pin) {
          if (pin.isNotEmpty && !last) {
            FocusScope.of(context).nextFocus();
          } else if (pin.isEmpty && !first) {
            FocusScope.of(context).previousFocus();
          }
          onChanged?.call(pin);
        },
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: TextStyle(
          color: Theme.of(context).primaryTextColor,
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: outlineBorder(color: Theme.of(context).borderColor),
          enabledBorder: outlineBorder(color: Theme.of(context).borderColor),
          focusedBorder: outlineBorder(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}

OutlineInputBorder outlineBorder({required Color color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color),
    borderRadius: BorderRadius.circular(5),
  );
}
