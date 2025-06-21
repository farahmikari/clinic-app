import 'package:animated_background/animated_background.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clinic_app/app/bottom_navigation_bar/views/screens/bottom_navigation_bar_screen.dart';
import 'package:clinic_app/app/home/controllers/most%20rated%20doctors%20bloc/most_rated_doctors_bloc.dart';
import 'package:clinic_app/app/login/views/widgets/button_widget.dart';
import 'package:clinic_app/app/login/views/widgets/text_form_field_widget.dart';
import 'package:clinic_app/app/signup/controllers/bloc/image_bloc/image_bloc.dart';
import 'package:clinic_app/app/signup/controllers/bloc/signup_bloc/signup_bloc.dart';
import 'package:clinic_app/app/signup/controllers/services/image_picker_service.dart';
import 'package:clinic_app/app/signup/views/widgets/image_profile_widget.dart';

import 'package:clinic_app/consts.dart';
import 'package:clinic_app/core/utils/snack_bar_util.dart';
import 'package:clinic_app/service_locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static String id = "Sign Up";

  @override
  State<SignUp> createState() => _SignupState();
}

class _SignupState extends State<SignUp> with SingleTickerProviderStateMixin {
  String? valueBirth;
  bool _obscure = false;
  bool _conObscure = false;
  final List<String> genderOption = ['Male', 'Female'];

  TextEditingController birthController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)?.settings.arguments as String;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignupBloc()),
        BlocProvider(
          create: (context) => ImageBloc(pickimage: ImagePickerService()),
        ),
        BlocProvider.value(value: getIt<MostRatedDoctorsBloc>()),
      ],

      child: Scaffold(
        backgroundColor: Colors.white,
        body: AnimatedBackground(
          vsync: this,
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
              baseColor: kPrimaryColor.withValues(alpha: 4),
              spawnMaxRadius: 30,
              spawnMinSpeed: 15,
              particleCount: 10,
              spawnMaxSpeed: 200,
              spawnOpacity: 0,
            ),
          ),
          child: SingleChildScrollView(
            child: BlocConsumer<SignupBloc, SignupBaseState>(
              listener: (context, state) {
                switch (state) {
                  case SignupSuccess():
                    showSnackBar(
                      context,
                      title: "Success",
                      message: "Signup Successfully",
                      contentType: ContentType.success,
                    );
                    Get.offAll(() => BottomNavigationBarScreen());
                    break;
                  case SignupFailed():
                    showSnackBar(
                      context,
                      title: "Failed",
                      message: "Failed signup",
                      contentType: ContentType.failure,
                    );
                    break;
                  default:
                    break;
                }
              },
              builder: (context, state) {
                final signupData = state.data;
                final bool isLoading = state is SignupLoading;

                return Form(
                  key: signupData.formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "set your information ",
                            style: TextStyle(
                              fontFamily: "Montserat",
                              fontSize: 22,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        BlocListener<ImageBloc, ImageState>(
                          listener: (context, state) {
                            if (state is ImageSuccess) {
                              context.read<SignupBloc>().add(
                                SImageEvent(image: state.image),
                              );
                            }
                          },
                          child: ImageProfileWidget(),
                        ),
                        SizedBox(height: 10),
                        TextFormFieldWidget(
                          label: 'First Name',
                          iconTextField: Icons.person,

                          onChanged: (value) {
                            context.read<SignupBloc>().add(
                              SFirstNameFieldEvent(name: value),
                            );
                            context.read<SignupBloc>().add(SButtonEvent());
                          },
                          error: signupData.firstName.error,
                          validator: (value) => signupData.firstName.error,
                        ),

                        TextFormFieldWidget(
                          label: 'Last Name',
                          iconTextField: Icons.person,

                          onChanged: (value) {
                            context.read<SignupBloc>().add(
                              SLastNameFieldEvent(name: value),
                            );
                            context.read<SignupBloc>().add(SButtonEvent());
                          },
                          error: signupData.lastName.error,
                          validator: (value) => signupData.lastName.error,
                        ),
                        TextFormFieldWidget(
                          label: 'Birthday Date',
                          iconTextField: Icons.person,
                          validator: (value) => signupData.birthDate.error,
                          error: signupData.birthDate.error,

                          controller: birthController,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () {
                              _selectDate(context);
                            },
                          ),

                          readOnly: true,
                        ),

                        TextFormFieldWidget(
                          label: 'Gender',
                          iconTextField: Icons.transgender,
                          error: signupData.gender.error,
                          validator: (value) => signupData.gender.error,
                          onChanged: (value) {},
                          controller: genderController,
                          readOnly: true,
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (_) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children:
                                      genderOption.map((gender) {
                                        return ListTile(
                                          leading: Icon(
                                            gender == 'Male'
                                                ? Icons.male
                                                : Icons.female,
                                          ),
                                          title: Text(gender),
                                          onTap: () {
                                            context.read<SignupBloc>().add(
                                              SGenderFieldEvent(gender: gender),
                                            );
                                            context.read<SignupBloc>().add(
                                              SButtonEvent(),
                                            );
                                            genderController.text = gender;
                                            Navigator.pop(context);
                                          },
                                        );
                                      }).toList(),
                                );
                              },
                            );
                          },
                        ),
                        TextFormFieldWidget(
                          label: 'Phone',
                          iconTextField: Icons.phone,

                          onChanged: (value) {
                            context.read<SignupBloc>().add(
                              SPhoneFieldEvent(phone: value),
                            );

                            context.read<SignupBloc>().add(SButtonEvent());
                            // print("errorrrrrr");
                          },
                          error: signupData.phone.error,
                          validator: (value) => signupData.phone.error,
                        ),

                        TextFormFieldWidget(
                          label: 'Password',
                          iconTextField: Icons.key,
                          error: signupData.password.error,
                          validator: (value) => signupData.password.error,
                          onChanged: (value) {
                            context.read<SignupBloc>().add(
                              SPasswordFieldEvent(password: value),
                            );
                            context.read<SignupBloc>().add(SButtonEvent());
                          },
                          obscure: _obscure,
                          suffixIcon: IconButton(
                            onPressed: () {
                              _obscure = !_obscure;
                              context.read<SignupBloc>().add(
                                SObscureEvent(obscure: !_obscure),
                              );
                            },
                            icon: Icon(
                              _obscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        TextFormFieldWidget(
                          label: 'Confirm Password',
                          iconTextField: Icons.key,
                          error: signupData.conPassword.error,
                          validator: (value) => signupData.conPassword.error,
                          onChanged: (value) {
                            context.read<SignupBloc>().add(
                              SConPasswordFieldEvent(password: value),
                            );
                            context.read<SignupBloc>().add(SButtonEvent());
                          },
                          obscure: _conObscure,
                          suffixIcon: IconButton(
                            onPressed: () {
                              _conObscure = !_conObscure;
                              context.read<SignupBloc>().add(
                                SConObscureEvent(conObscure: _conObscure),
                              );
                            },
                            icon: Icon(
                              _conObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        MyButtonWidget(
                          text: 'Sign Up',
                          color: kPrimaryColor,
                          isLoading: isLoading,
                          onPressed:
                              (signupData.buttonEvent && !isLoading)
                                  ? () {
                                    context.read<SignupBloc>().add(
                                      SEmailFieldEvent(email: email),
                                    );
                                    context.read<SignupBloc>().add(
                                      SignupSubmitEvent(),
                                    );
                                  }
                                  : null,
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final bloc = context.read<SignupBloc>();
    DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(
            context,
          ).copyWith(colorScheme: ColorScheme.light(primary: kPrimaryColor)),
          child: child!,
        );
      },
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      valueBirth = picked.toString().split(' ')[0];
      birthController.text = valueBirth!;
      bloc.add(SBirthFieldEvent(birth: valueBirth!));
      bloc.add(SButtonEvent());
    }
  }
}
