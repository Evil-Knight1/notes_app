import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNote extends StatelessWidget {
  const AddNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CustomTextWidget(hint: 'Title'),
          const CustomTextWidget(hint: 'Description'),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(),
              child: const SizedBox(child: const Text('Save'))),
        ],
      ),
    );
  }
}
