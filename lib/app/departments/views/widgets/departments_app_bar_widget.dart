import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/widgets/search_widget.dart';

import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:flutter/material.dart';

class DepartmentsAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const DepartmentsAppBarWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(17.0.hp);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Departments",
        style: TextStyle(
          color: Theme.of(context).primaryTextColor,
          fontSize: AppDimensions.lfs,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10.0.hp),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.mm),
          child: SearchWidget(),
        ),
      ),
    );
  }
}
