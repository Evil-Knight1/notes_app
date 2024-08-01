import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      required this.icon,
      this.tooltip,
      this.backgroundColor,
      this.onPressed});
  final Icon icon;
  final String? tooltip;
  final Color? backgroundColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        style: IconButton.styleFrom(
            backgroundColor: backgroundColor,
            enableFeedback: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        onPressed: onPressed,
        tooltip: tooltip,
        icon: icon);
  }
}
