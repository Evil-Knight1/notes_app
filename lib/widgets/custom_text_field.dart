import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.maxLine,
    this.onSaved,
  });
  final String hint;
  final int? maxLine;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (val) {
          if (val?.isEmpty ?? true) {
            return 'Field is required';
          } else {
            return null;
          }
        },
        onSaved: onSaved,
        cursorColor: kPrimaryColor,
        maxLines: maxLine,
        decoration: InputDecoration(
          errorBorder: errorBorder(),
          focusedErrorBorder:errorBorder() ,
          enabledBorder: buildBorder(),
          hintText: hint,
          hintStyle: TextStyle(color: kPrimaryColor),
          focusedBorder: buildBorder(kPrimaryColor),
        ));
  }

  OutlineInputBorder errorBorder() {
    return OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white, width: 1),
    );
  }
}
