import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/request_types_widget/controllers/request%20types%20bloc/request_types_bloc.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/request_types_widget/models/request_type_model.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
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
        return Theme.of(context).accentColor;
      } else if (requestType.id == currentRequestTypeId) {
        return Theme.of(context).primaryColor;
      } else {
        return Theme.of(context).primaryBackgroundColor;
      }
    }

    Color specifyTitleColor() {
      if (requestType.id == previousRequestTypeId) {
        return Theme.of(context).foregroundColor;
      } else if (requestType.id == currentRequestTypeId) {
        return Theme.of(context).foregroundColor;
      } else if (isRequestTypesWidgetActived) {
        return Theme.of(context).primaryTextColor;
      } else {
        return Theme.of(context).hintTextColor;
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
