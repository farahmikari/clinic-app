import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/request%20types%20widget/models/json_data.dart';
import 'package:clinic_app/core/widgets/request%20types%20widget/models/request_type_model.dart';
import 'package:clinic_app/core/widgets/request%20types%20widget/views/items/type_item.dart';
import 'package:flutter/material.dart';

class DroppableItem extends StatelessWidget {
  const DroppableItem({
    super.key,
    required this.height,
    required this.currentRequestTypeId,
    required this.previousRequestTypeId,
    required this.isRequestTypesWidgetActived,
  });

  final double height;
  final int currentRequestTypeId;
  final int previousRequestTypeId;
  final bool isRequestTypesWidgetActived;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: height,
      padding: EdgeInsets.only(top: 8.0.hp, bottom: AppDimensions.mp),
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TypeItem(
            requestType: RequestTypeModel.fromJson(requestTypes[0]),
            currentRequestTypeId: currentRequestTypeId,
            previousRequestTypeId: previousRequestTypeId,
            isRequestTypesWidgetActived: isRequestTypesWidgetActived,
          ),
          TypeItem(
            requestType: RequestTypeModel.fromJson(requestTypes[1]),
            currentRequestTypeId: currentRequestTypeId,
            previousRequestTypeId: previousRequestTypeId,
            isRequestTypesWidgetActived: isRequestTypesWidgetActived,
          ),
        ],
      ),
    );
  }
}
