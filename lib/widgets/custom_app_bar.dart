import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon_button.dart';

class CustomAppBar {
  static AppBar customAppBar(
      {void Function()? onPressed,
      IconData? icon,
      Color? background,
      required String title, List<Widget>? action}) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 36),
      ),
      actions: [
        CustomIconButton(
          icon: Icon(
            icon,
            size: 32,
          ),
          backgroundColor: background,
          onPressed: onPressed ?? () {},
          tooltip: 'Search Bar',
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
