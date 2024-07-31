import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/notes_model.dart';
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
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, desc;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomTextFormField(
            hint: 'Title',
            onSaved: (val) {
              title = val;
            },
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            hint: 'Content',
            maxLine: 5,
            onSaved: (val) => desc = val,
          ),
          const SizedBox(height: 40),
          CustomTextButton(
            text: 'Save',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                Hive.box(kNotesBox).add(NotesModel(
                    title: title!,
                    desc: desc!,
                    time: DateTime.now().toString(),
                    color: 0123));
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
