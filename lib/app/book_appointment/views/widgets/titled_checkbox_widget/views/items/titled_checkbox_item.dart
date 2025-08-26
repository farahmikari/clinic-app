import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/titled_checkbox_widget/controllers/titled_checkbox_bloc/titled_checkbox_bloc.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitledCheckboxItem extends StatelessWidget {
  const TitledCheckboxItem({
    super.key,
    required this.isPreviousChecked,
    required this.isCurrentChecked,
    required this.isTitledCheckboxWidgetActived,
    required this.title,
  });

  final bool isPreviousChecked;
  final bool isCurrentChecked;
  final bool isTitledCheckboxWidgetActived;
  final String title;

  @override
  Widget build(BuildContext context) {
    Color specifyActiveColor() {
      if (isPreviousChecked) {
        return Theme.of(context).accentColor;
      } else {
        return Theme.of(context).primaryColor;
      }
    }

    Color specifyTitleAndSideColor() {
      if (isTitledCheckboxWidgetActived) {
        return Theme.of(context).primaryTextColor;
      } else {
        return Theme.of(context).hintTextColor;
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).primaryTextColor,
            fontSize: AppDimensions.lfs,
            fontWeight: FontWeight.bold,
          ),
        ),
        Checkbox(
          value: isCurrentChecked,
          onChanged: (value) {
            if (isTitledCheckboxWidgetActived) {
              context.read<TitledCheckboxBloc>().add(
                IsCurrentCheckedIsToggled(),
              );
            }
          },
          activeColor: specifyActiveColor(),
          side: BorderSide(color: specifyTitleAndSideColor(), width: 2),
        ),
      ],
    );
  }
}
