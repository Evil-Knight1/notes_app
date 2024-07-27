import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxLine
  });
  final String hint;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: kPrimaryColor,
        maxLines: maxLine,
        
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
