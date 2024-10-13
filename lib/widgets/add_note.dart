import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NoteState>(
      listener: (context, state) {
        if (state is AddNoteFailureState) {
          print('Error');
        }
        if (state is AddNoteSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
              right: 16,
              left: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AbsorbPointer(
            absorbing: state is AddNoteLoadingState ? true : false,
            child: const SingleChildScrollView(
              child: AddNoteForm(),
            ),
          ),
        );
      },
    );
  }
}
