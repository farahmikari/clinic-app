import 'package:clinic_app/app/book_appointment/views/widgets/titled_checkbox_widget/controllers/titled_checkbox_bloc/titled_checkbox_bloc.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/titled_checkbox_widget/views/items/titled_checkbox_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitledCheckboxWidget extends StatelessWidget {
  const TitledCheckboxWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TitledCheckboxBloc, TitledCheckboxState>(
      builder: (context, state) {
        return TitledCheckboxItem(
          isPreviousChecked: state.isPreviousChecked,
          isCurrentChecked: state.isCurrentChecked,
          isTitledCheckboxWidgetActived: state.isTitledCheckboxWidgetActived,
          title: title,
        );
      },
    );
  }
}
