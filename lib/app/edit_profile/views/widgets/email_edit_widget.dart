import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clinic_app/app/login/views/widgets/text_form_field_widget.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_bloc.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_event.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_state.dart';
import 'package:clinic_app/app/verification/model/verification_goto.dart';
import 'package:clinic_app/app/verification/views/screen/verification_screen.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/utils/snack_bar_util.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocConsumer<EmailBloc, EmailState>(
      listener: (context, state) {
        if (state is EmailLoading) {
          Get.dialog(
            Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
            barrierDismissible: false,
          );
        } else {
          if (Get.isDialogOpen ?? false) Get.back();
        }
        switch (state) {
          case EmailSuccess():
            showSnackBar(
              context,
              title: S.current.success,
              message: S.current.verify_code_is_sent_successfully,
              contentType: ContentType.success,
            );
            Get.offAll(
              () => VerificationScreen(
                email: newEmailController.text,
                source: VerificationGoto.changeEmail,
              ),
            );
            break;
          case EmailFailed():
            showSnackBar(
              context,
              title: S.current.failed,
              message: S.current.verification_failed,
              contentType: ContentType.failure,
            );
            break;
          default:
            break;
        }
      },
      builder: (context, state) {
        return TextFormFieldWidget(
          label: S.current.email,
          iconTextField: Icons.email_outlined,
          controller: emailController,
          readOnly: true,
          suffixIcon: IconButton(
            onPressed: () {
              showEditEmailDialog(context, state);
            },
            icon: Icon(Icons.edit),
          ),
        );
      },
    );
  }

  void showEditEmailDialog(BuildContext context, EmailState state) {
    showCupertinoDialog(
      context: context,
      builder:
          (_) => CupertinoAlertDialog(
            title: Text(
              S.current.edit_email,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            content: CupertinoTextField(
              controller: newEmailController,
              placeholder: S.current.enter_new_email,
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
                  S.current.cancel,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: const Color(0xFF99231B),
                    fontSize: 16,
                  ),
                ),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  {
                    context.read<EmailBloc>().add(
                      CanSubmitEmail(
                        email: newEmailController.text,
                        source: VerificationGoto.changeEmail,
                      ),
                    );
                  }
                },
                child: Text(
                  S.current.cotinue,
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
