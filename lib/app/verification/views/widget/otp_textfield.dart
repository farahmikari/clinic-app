import 'package:clinic_app/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPForm extends StatelessWidget {
  const OTPForm({super.key, required this.controller, required this.onChanged,required this.first,required this.last});
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
          if (pin.isNotEmpty&&!last) {
            FocusScope.of(context).nextFocus();
           
          }
         
           else if (pin.isEmpty&&!first) {
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
