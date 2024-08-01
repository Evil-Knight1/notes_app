import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/add_note.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar().customAppBar(title: 'Notes', icon: Icons.search),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<void>(
                useSafeArea: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                // backgroundColor: Colors.lightBlue,
                showDragHandle: true,
                context: context,
                builder: (context) {
                  return  AddNote();
                });
          },
          backgroundColor: const Color(0xFF2CD7EE),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            size: 32,
            color: Colors.black,
          ),
        ),
        body: ValueListenableBuilder<Box>(
          valueListenable: Hive.box<NotesModel>(kNotesBox).listenable(),
          builder: (context, box, widget) {
            Box<dynamic> data = box;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) =>
                    CustomNoteItem(note: data.getAt(index)));
          },
        ));
  }
}
