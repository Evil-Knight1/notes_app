import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/custom_text_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key, required this.note});
  final NotesModel note;

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              hint: 'Edit Title',
              initialValue: widget.note.title,
              onSaved: (val) => widget.note.title = val!,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              hint: 'Edit Description',
              maxLine: 5,
              onSaved: (val) {
                widget.note.desc = val!;
              },
              initialValue: widget.note.desc,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextButton(
              text: 'Update',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                  setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    'Edited Done',
                  )));
                  Navigator.pop(context);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
