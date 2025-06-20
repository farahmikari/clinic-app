import 'package:clinic_app/app/book%20appointment/controllers/confirm%20bloc/confirm_bloc.dart';
import 'package:clinic_app/app/book%20appointment/views/widgets/confirm_button_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ConfirmButtonSection extends StatelessWidget {
  const ConfirmButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfirmBloc, ConfirmState>(
      listener: (context, state) {
        if (state is ConfirmLoaded) {
          Get.back();
        }
      },
      builder: (context, state) {
        switch (state) {
          //------------!! Initial State !!----------------------------------------------------------------------------------------------------------------------------------------
          case ConfirmInitial():
            return ConfirmButtonWidget();
          //------------!! Loading State !!----------------------------------------------------------------------------------------------------------------------------------------
          case ConfirmLoading():
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: AppColors.primaryColor,
                size: 8.0.hp,
              ),
            );
          //------------!! Loaded State !!-----------------------------------------------------------------------------------------------------------------------------------------
          case ConfirmLoaded():
            return SizedBox();
          //------------!! Failure State !!----------------------------------------------------------------------------------------------------------------------------------------
          case ConfirmFailed():
            return ConfirmButtonWidget();
        }
      },
    );
  }
}
