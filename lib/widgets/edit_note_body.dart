import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
        CustomTextField(hint: 'Edit Title'),
        SizedBox(
          height: 20,
        ),
        CustomTextField(
          hint: 'Edit Description',
          maxLine: 5,
        ),
        SizedBox(
          height: 40,
        ),
        CustomTextButton(text: 'Update'),
      ]),
    );
  }
}
