import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/request_types_widget/controllers/request%20types%20bloc/request_types_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LabelItem extends StatelessWidget {
  const LabelItem({
    super.key,
    required this.label,
    required this.isRequestTypesWidgetActived,
  });

  final String label;
  final bool isRequestTypesWidgetActived;

  @override
  Widget build(BuildContext context) {
    Color specifyLabelColor() {
      return isRequestTypesWidgetActived
          ? Theme.of(context).primaryTextColor
          : Theme.of(context).hintTextColor;
    }

    return GestureDetector(
      onTap: () {
        context.read<RequestTypesBloc>().add(IsDroppedDownToggled());
      },
      child: Container(
        height: 16.0.wp,
        width: 92.0.wp,
        padding: EdgeInsets.all(AppDimensions.mp),
        decoration: BoxDecoration(
          color: Theme.of(context).accentBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: AppDimensions.sp,
          children: [
            SvgPicture.asset(
              AppIcons.requestType,
              height: AppDimensions.lis,
              width: AppDimensions.lis,
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: specifyLabelColor(),
                fontSize: AppDimensions.mfs,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: SvgPicture.asset(
                  AppIcons.arrowDown,
                  height: AppDimensions.sis,
                  width: AppDimensions.sis,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
