import 'package:animated_background/animated_background.dart';
import 'package:clinic_app/bloc/login_bloc/login_bloc_bloc.dart';
import 'package:clinic_app/bloc/signup_bloc/signup_bloc.dart';
import 'package:clinic_app/consts.dart';
import 'package:clinic_app/widgets/myButtonWidget.dart';
import 'package:clinic_app/widgets/textFormFieldWedgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});
  static String id = "Sign Up";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  String? valueBirth;
  bool _obscure = false;
  bool _conObscure = false;
  final List<String> genderOption = ['Male', 'Female'];
  TextEditingController birthController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
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
            child: BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) {
                return Form(
                  key: state.formKey,
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
                        Stack(
                          children: [
                            Container(
                              width: 160,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                border: Border.all(color: kPrimaryColor),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey.shade200,
                                radius: 65,
                                child: Icon(
                                  Icons.person,
                                  color: kPrimaryColor,
                                  size: 120,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 130,
                              right: 20,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  border: Border.all(color: kPrimaryColor),
                                  color: kPrimaryColor,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.grey.shade200,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Textformfeildwedgit(
                          label: 'First Name',
                          iconTextField: Icons.person,
                  
                          onChanged: (value) {
                            context.read<SignupBloc>().add(
                              SFirstNameFieldEvent(name: value),
                            );
                            context.read<SignupBloc>().add(SButtonEvent());
                            // print("errorrrrrr");
                          },
                          error: state.firstName.error,
                          validator: (value) => state.firstName.error,
                        ),
                  
                        Textformfeildwedgit(
                          label: 'Last Name',
                          iconTextField: Icons.person,
                  
                          onChanged: (value) {
                            context.read<SignupBloc>().add(
                              SLastNameFieldEvent(name: value),
                            );
                            context.read<SignupBloc>().add(SButtonEvent());
                            // print("errorrrrrr");
                          },
                          error: state.lastName.error,
                          validator: (value) => state.lastName.error,
                        ),
                        Textformfeildwedgit(
                          label: 'Birthday Date',
                          iconTextField: Icons.person,
                          validator: (value) => state.birthDate.error,
                          error: state.phone.error,
                          onChanged: (value) {
                            context.read<SignupBloc>().add(
                              SBirthFieldEvent(birth: value),
                            );
                            context.read<SignupBloc>().add(SButtonEvent());
                            //
                          },
                          controller: birthController,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () {
                              _selectDate(context);
                            },
                          ),
                  
                          readOnly: true,
                        ),
                        // DropdownButtonFormField<String>(
                        //   value: state.gender.value,
                        //   items:
                        //       genderOption
                        //           .map(
                        //             (gender) => DropdownMenuItem(
                        //               value: gender,
                        //               child: Row(children: [Text(gender)]),
                        //             ),
                        //           )
                        //           .toList(),
                        //   onChanged: (value) {
                        //     if (value != null) {
                        //       context.read<SignupBloc>().add(
                        //         SGenderFieldEvent(gender: value),
                        //       );
                        //     }
                        //   },
                        // )
                        Textformfeildwedgit(
                          label: 'Gender',
                          iconTextField: Icons.transgender,
                          error: state.gender.error,
                          validator: (value) => state.gender.error,
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
                        Textformfeildwedgit(
                          label: 'Email Name',
                          iconTextField: Icons.email,
                  
                          onChanged: (value) {
                            context.read<SignupBloc>().add(
                              SEmailFieldEvent(email: value),
                            );
                            context.read<SignupBloc>().add(SButtonEvent());
                            // print("errorrrrrr");
                          },
                          error: state.email.error,
                          validator: (value) => state.email.error,
                        ),
                  
                  
                        Textformfeildwedgit(
                          label: 'Password',
                          iconTextField: Icons.key,
                          error: state.password.error,
                          validator: (value) => state.password.error,
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
                                SObscureEvent(obscure: _obscure),
                              );
                            },
                            icon: Icon(
                              _obscure ? Icons.visibility_off : Icons.visibility,
                            ),
                          ),
                        ),
                        Textformfeildwedgit(
                          label: 'Confirm Password',
                          iconTextField: Icons.key,
                          error: state.conPassword.error,
                          validator: (value) => state.conPassword.error,
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
                        Mybuttonwidget(
                          text: 'Sign Up',
                          onPressed: state.buttonEvent ? () {} : null,
                          color: kPrimaryColor,
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
    DateTime? _picked = await showDatePicker(
      builder: (context, child) {
        //  here you can return  a child
        return Theme(
          data: Theme.of(
            context,
          ).copyWith(colorScheme: ColorScheme.light(primary: kPrimaryColor)),
          child: child!,
        ); // pass child to this child
      },
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (_picked != null) {
      valueBirth = _picked.toString().split(' ')[0];
      birthController.text = valueBirth!;
      context.read<SignupBloc>().add(SBirthFieldEvent(birth: valueBirth!));
      context.read<SignupBloc>().add(SButtonEvent());
    } 
  }
}
