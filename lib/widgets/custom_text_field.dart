import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.hint,
  });
  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          enabledBorder: buildBorder(),
          hintText: 'Title',
          hintStyle: TextStyle(color: kPrimaryColor),
          focusedBorder: buildBorder(kPrimaryColor),
        ));
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white, width: 1),
    );
  }
}
