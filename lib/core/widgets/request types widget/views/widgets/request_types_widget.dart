import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/request%20types%20widget/controllers/request%20types%20bloc/request_types_bloc.dart';
import 'package:clinic_app/core/widgets/request%20types%20widget/models/request_type_ids.dart';
import 'package:clinic_app/core/widgets/request%20types%20widget/views/items/droppable_item.dart';
import 'package:clinic_app/core/widgets/request%20types%20widget/views/items/label_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestTypesWidget extends StatelessWidget {
  const RequestTypesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<RequestTypesBloc, RequestTypesState>(
          builder: (context, state) {
            final double height = state.isDroppedDown ? 16.0.hp : 8.0.hp;
            return DroppableItem(
              height: height,
              currentRequestTypeId: state.currentRequestTypeId,
              previousRequestTypeId: state.previousRequestTypeId,
              isRequestTypesWidgetActived: state.isRequestTypesWidgetActived,
            );
          },
        ),
        BlocBuilder<RequestTypesBloc, RequestTypesState>(
          builder: (context, state) {
            if (state.currentRequestTypeId != -1) {
              switch (state.currentRequestTypeId) {
                case RequestTypeIds.checkUp:
                  return LabelItem(label: "Check-Up");
                case RequestTypeIds.followUp:
                  return LabelItem(label: "Follow-Up");
              }
            } else if (state.previousRequestTypeId != -1) {
              switch (state.previousRequestTypeId) {
                case RequestTypeIds.checkUp:
                  return LabelItem(label: "Check-Up");
                case RequestTypeIds.followUp:
                  return LabelItem(label: "Follow-Up");
              }
            }
            return LabelItem(label: "Request Type");
          },
        ),
      ],
    );
  }
}
