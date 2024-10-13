import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class FavNotesPage extends StatelessWidget {
  const FavNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAppBar(
        title: 'Notes',
        icon: Icons.search,
        background: const Color(0x639E9E9E),
        onPressed: () {},
      ),
      body: BlocBuilder<NotesCubit, NoteState>(builder: (context, state) {
        List<NotesModel> notes = context.read<NotesCubit>().notes;
        List<NotesModel> favNotes = [];

        for (int i = 0; i < notes.length; i++) {
          if (notes[i].fav ?? false) {
            favNotes.add(notes[i]);
          }
        }
        return notes.isNotEmpty
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: favNotes.length,
                itemBuilder: (context, index) => CustomNoteItem(
                      note: favNotes[index],
                    ))
            : const Center(
                child: Text('No favorite notes found'),
              );
      }),
    );
  }
}
