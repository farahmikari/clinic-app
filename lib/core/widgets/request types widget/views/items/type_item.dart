import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/widgets/request%20types%20widget/controllers/request%20types%20bloc/request_types_bloc.dart';
import 'package:clinic_app/core/widgets/request%20types%20widget/models/request_type_model.dart';
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
    Color specifyBackgroundColor() {
      if (requestType.id == previousRequestTypeId) {
        return AppColors.transparentYellow;
      } else if (requestType.id == currentRequestTypeId) {
        return AppColors.primaryColor;
      } else {
        return AppColors.backgroundColor;
      }
    }

    Color specifyTitleColor() {
      if (requestType.id == previousRequestTypeId) {
        return AppColors.widgetBackgroundColor;
      } else if (requestType.id == currentRequestTypeId) {
        return AppColors.widgetBackgroundColor;
      } else if (isRequestTypesWidgetActived) {
        return AppColors.mainTextColor;
      } else {
        return AppColors.hintTextColor;
      }
    }

    return InkWell(
      onTap: () {
        if (isRequestTypesWidgetActived) {
          context.read<RequestTypesBloc>().add(
            CurrentRequestTypeIdChanged(currentRequestTypeId: requestType.id),
          );
        }
      },
      borderRadius: BorderRadius.circular(AppDimensions.lbr),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.xlp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: specifyBackgroundColor(),
          borderRadius: BorderRadius.circular(AppDimensions.lbr),
        ),
        child: Text(
          requestType.type,
          style: TextStyle(
            color: specifyTitleColor(),
            fontSize: AppDimensions.mfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
