import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:clinic_app/core/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class AppBarWithSearchWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarWithSearchWidget({super.key, required this.title});
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(35.0.wp);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 20.0.wp,
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).primaryTextColor,
          fontSize: AppDimensions.lfs,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(15.0.wp),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: AppDimensions.mp,
            left: AppDimensions.mp,
            right: AppDimensions.mp,
          ),
          child: SearchWidget(),
        ),
      ),
    );
  }
}
