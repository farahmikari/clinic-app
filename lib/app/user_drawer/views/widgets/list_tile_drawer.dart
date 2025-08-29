import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ListTileDrawerWidget extends StatelessWidget {
  const ListTileDrawerWidget({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.backgroundIconColor,
    required this.title,
    this.onTap,
  });
  final IconData icon;
  final Color iconColor;
  final Color backgroundIconColor;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: backgroundIconColor,
              child: Icon(icon, color: iconColor),
            ),
            title: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).primaryTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing:
                title != S.current.logout
                    ? Icon(
                      Icons.arrow_back_ios,
                      textDirection:
                          Directionality.of(context) == TextDirection.rtl
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                      color: Theme.of(context).accentTextColor,
                      size: 12,
                    )
                    : null,
          ),
        ),
        Divider(color: Theme.of(context).hintTextColor, thickness: 0.5),
      ],
    );
  }
}
