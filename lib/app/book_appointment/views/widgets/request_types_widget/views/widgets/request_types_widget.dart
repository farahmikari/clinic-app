import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/request_types_widget/controllers/request%20types%20bloc/request_types_bloc.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/request_types_widget/models/request_type_ids.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/request_types_widget/views/items/droppable_item.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/request_types_widget/views/items/label_item.dart';
import 'package:clinic_app/generated/l10n.dart';
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
            final double height = state.isDroppedDown ? 32.0.wp : 16.0.wp;
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
            late String label = S.current.reservation_type;
            if (state.currentRequestTypeId != -1) {
              switch (state.currentRequestTypeId) {
                case RequestTypeIds.checkUp:
                  label = S.current.check_up;
                case RequestTypeIds.followUp:
                  label = S.current.follow_up;
              }
            } else if (state.previousRequestTypeId != -1) {
              switch (state.previousRequestTypeId) {
                case RequestTypeIds.checkUp:
                  label = S.current.check_up;
                case RequestTypeIds.followUp:
                  label = S.current.follow_up;
              }
            }
            return LabelItem(
              label: label,
              isRequestTypesWidgetActived: state.isRequestTypesWidgetActived,
            );
          },
        ),
      ],
    );
  }
}
