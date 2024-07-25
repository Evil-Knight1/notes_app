import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.icon, this.tooltip});
  final Icon icon;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        style: IconButton.styleFrom(
            backgroundColor: const Color(0x679E9E9E),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        onPressed: () {},
        tooltip: tooltip,
        icon: icon);
  }
}
