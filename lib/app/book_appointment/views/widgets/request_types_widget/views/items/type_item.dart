import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/request_types_widget/controllers/request%20types%20bloc/request_types_bloc.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/request_types_widget/models/request_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypeItem extends StatelessWidget {
  const TypeItem({
    super.key,
    required this.requestType,
    required this.currentRequestTypeId,
    required this.previousRequestTypeId,
    required this.isRequestTypesWidgetActived,
  });

  final RequestTypeModel requestType;
  final int currentRequestTypeId;
  final int previousRequestTypeId;
  final bool isRequestTypesWidgetActived;

  @override
  Widget build(BuildContext context) {
    Color specifyprimaryBackgroundColor() {
      if (requestType.id == previousRequestTypeId) {
        return AppColors.transparentAccentColor;
      } else if (requestType.id == currentRequestTypeId) {
        return AppColors.primaryColor;
      } else {
        return AppColors.primaryBackgroundColor;
      }
    }

    Color specifyTitleColor() {
      if (requestType.id == previousRequestTypeId) {
        return AppColors.accentBackgroundColor;
      } else if (requestType.id == currentRequestTypeId) {
        return AppColors.accentBackgroundColor;
      } else if (isRequestTypesWidgetActived) {
        return AppColors.primaryTextColor;
      } else {
        return AppColors.hintTextColor;
      }
    }

    return GestureDetector(
      onTap: () {
        if (isRequestTypesWidgetActived) {
          context.read<RequestTypesBloc>().add(
            CurrentRequestTypeIdChanged(currentRequestTypeId: requestType.id),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.xlp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: specifyprimaryBackgroundColor(),
          borderRadius: BorderRadius.circular(AppDimensions.lbr),
        ),
        child: Text(
          requestType.type,
          style: TextStyle(
            color: specifyTitleColor(),
            fontSize: AppDimensions.sfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
