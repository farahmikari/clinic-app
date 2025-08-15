import 'package:clinic_app/app/login/views/widgets/text_form_field_widget.dart';
import 'package:clinic_app/app/verification/model/verification_goto.dart';
import 'package:clinic_app/app/verification/views/screen/verification_screen.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailEditWidget extends StatelessWidget {
  const EmailEditWidget({
    super.key,
    required this.emailController,
    required this.newEmailController,
  });

  final TextEditingController emailController;
  final TextEditingController newEmailController;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      label: "email",
      iconTextField: Icons.email_outlined,
      controller: emailController,
      readOnly: true,
      suffixIcon: IconButton(
        onPressed: () {
          showEditEmailDialog(context);
        },
        icon: Icon(Icons.edit),
      ),
    );
  }

  void showEditEmailDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder:
          (_) => CupertinoAlertDialog(
            title: Text(
              "Edit email",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            content: CupertinoTextField(
              controller: newEmailController,
              placeholder: "Enter new email",
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
              ),
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "cancel",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: const Color(0xFF99231B),
                    fontSize: 16,
                  ),
                ),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Get.offAll(
                    () => VerificationScreen(
                      email: newEmailController.text,
                      source: VerificationGoto.changeEmail,
                    ),
                  );
                },
                child: Text(
                  'cotinue',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: const Color(0xFF047B08),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
