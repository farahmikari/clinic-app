import 'package:clinic_app/app/user_profile/controllers/bloc/profile_bloc/profile_bloc.dart';
import 'package:clinic_app/app/user_profile/models/user_data.dart';
import 'package:clinic_app/app/user_profile/views/widgets/failure_screen_widget.dart';
import 'package:clinic_app/app/user_profile/views/widgets/profile_information_widget.dart';
import 'package:clinic_app/app/user_profile/views/widgets/profile_loading_widget.dart';
import 'package:clinic_app/core/widgets/image_widget/controller/bloc/image_bloc/image_bloc.dart';
import 'package:clinic_app/core/widgets/image_widget/controller/service/image_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
     UserData user = UserData(
      firstName: "farah",
      lastName: "mikari",
      gender: "Female",
      birthDate: DateTime(2004,3,21),
      phoneNumber: "0999999999",
      email:"farah@gmail.com"
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileBloc()..add(ProfileEvent())),
        BlocProvider(
          create: (context) => ImageBloc(pickimage: ImagePickerService()),
        ),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          switch (state) {
            //////////////////////visitor//////////////////////////////////////////
            case ProfileBlocVisitor():
              return FailureScreenWidget(
                isVisitor: true,
                height: height,
                width: width,
                pathImage: "assets/images/No data-cuate.png",
                errorMessage: "Login first to show your data",
              );
            ///////////////////loading///////////////////////////////////////////
            case ProfileBlocLoading():
              return ProfileLoadingWidget(height: height, width: width);
            ///////////////////profile information///////////////////////////////
            case ProfileBlocSuccess():
              return ProfileInformationWidget(width: width, height: height,user: user,);
          }
          ////////////////////failure////////////////////////////////////////////
          return FailureScreenWidget(
            isVisitor: false,
            height: height,
            width: width,
            pathImage: "assets/images/404_Error_with_a_cute_animal-pana.png",
            errorMessage: "Data not found",
          );
        },
      ),
    );
  }
}





