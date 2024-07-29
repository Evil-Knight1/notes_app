import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_text_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNote extends StatelessWidget {
  const AddNote({
    super.key,
  });
  final String title = '';
  final String desc = '';
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextField(hint: 'Title'),
            SizedBox(height: 25),
            CustomTextField(
              hint: 'Content',
              maxLine: 5,
            ),
            SizedBox(height: 40),
            CustomTextButton(text: 'Save',),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

