import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/pages/fav_notes_page.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/add_note.dart';
import 'package:notes_app/widgets/custom_note_item.dart';
import 'package:notes_app/widgets/custom_text_button.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  void initState() {
    context.read<NotesCubit>().fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.customAppBar(
            title: 'Notes',
            icon: Icons.search,
            background: const Color(0x639E9E9E),
            onPressed: () {}),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                  )),
              const ListTile(
                leading: Icon(Icons.note),
                title: Text('Home'),
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('Favorite'),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavNotesPage())),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            customModalBottomSheet(context);
          },
          backgroundColor: const Color(0xFF2CD7EE),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            size: 32,
            color: Colors.black,
          ),
        ),
        body: BlocBuilder<NotesCubit, NoteState>(
          builder: (context, state) {
            List<NotesModel> notes = context.read<NotesCubit>().notes;
            return notes.isEmpty
                ? SizedBox(
                    width: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'No Notes To Show',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            child: CustomTextButton(
                              text: 'Add Note',
                              onPressed: () => customModalBottomSheet(context),
                            ),
                          ),
                        ]),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: notes.length,
                    itemBuilder: (context, index) => CustomNoteItem(
                          note: notes[index],
                        ));
          },
        ));
  }

  Future<void> customModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
        useSafeArea: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        // backgroundColor: Colors.lightBlue,
        isScrollControlled: true,
        showDragHandle: true,
        context: context,
        builder: (context) {
          return const AddNoteBottomSheet();
        });
  }
}
