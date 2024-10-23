import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/service/setting_service.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.maxLine,
    this.onSaved,
    this.initialValue,
  });
  final String hint;
  final String? initialValue;
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
        initialValue: initialValue,
        onSaved: onSaved,
        cursorColor: kPrimaryColor,
        maxLines: maxLine,
        decoration: InputDecoration(
          errorBorder: errorBorder(),
          focusedErrorBorder: errorBorder(),
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
      borderSide: BorderSide(color: color ?? themeColor(), width: 1),
    );
  }

  Color themeColor() {
    return SettingsService.loadThemeMode()! ? Colors.white : const Color(0xFF7C7C7C);
  }
}
