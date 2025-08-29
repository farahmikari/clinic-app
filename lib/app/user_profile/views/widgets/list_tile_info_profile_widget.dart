import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:flutter/material.dart';

class ListTileInfoProfileWidget extends StatelessWidget {
  const ListTileInfoProfileWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.title,
  });
  final String text;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Theme.of(context).primaryColor),
          title: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          ),
          subtitle: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).primaryTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        Divider(color: Theme.of(context).hintTextColor, thickness: 0.3),
      ],
    );
  }
}
