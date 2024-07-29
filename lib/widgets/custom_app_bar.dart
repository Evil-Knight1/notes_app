import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon_button.dart';

class CustomAppBar {
  AppBar customAppBar({required IconData icon, required String title}) {
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
          backgroundColor: const Color(0x679E9E9E),
          tooltip: 'Search Bar',
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
