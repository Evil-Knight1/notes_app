import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/custom_block_color_picker.dart';
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
  bool error = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, desc;
  Color? color;
  DateTime now = DateTime.now();
  String? date;
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
          const SizedBox(height: 20),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    DateTime selectedDate = DateTime.now();
                    showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    setState(() => date =
                        '${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}');
                  },
                  icon: const Icon(Icons.calendar_month)),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomBlockColorPicker(
                            onColorChanged: (newColor) {
                              color = newColor;
                              if (error) {
                                setState(() {
                                  error = false;
                                });
                              }
                            },
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.color_lens,
                  )),
            ],
          ),
          const SizedBox(height: 10),
          BlocBuilder<AddNoteCubit, AddNoteCubitState>(
            builder: (context, state) {
              return CustomTextButton(
                isLoading: state is AddNoteLoadingState ? true : false,
                text: 'Add',
                onPressed: () {
                  if (formKey.currentState!.validate() && color != null) {
                    formKey.currentState!.save();
                    NotesModel note = NotesModel(
                        title: title!,
                        desc: desc!,
                        time: date ??
                            '${DateTime.now().year} - ${DateTime.now().month} - ${DateTime.now().day}',
                        color: color!.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
