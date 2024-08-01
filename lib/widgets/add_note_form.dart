import 'package:flutter/cupertino.dart';
import 'package:notes_app/widgets/custom_text_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

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