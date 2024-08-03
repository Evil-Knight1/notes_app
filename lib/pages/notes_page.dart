import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/add_note.dart';
import 'package:notes_app/widgets/custom_note_item.dart';
import 'package:notes_app/widgets/custom_text_button.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
          appBar: CustomAppBar().customAppBar(
              title: 'Notes',
              icon: Icons.search,
              background: const Color(0x639E9E9E),
              onPressed: () {}),
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
          body: ValueListenableBuilder<Box>(
            valueListenable: Hive.box<NotesModel>(kNotesBox).listenable(),
            builder: (context, box, widget) {
              Box<dynamic> data = box;
              return data.isEmpty
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
                                onPressed: () =>
                                    customModalBottomSheet(context),
                              ),
                            ),
                          ]),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) => CustomNoteItem(
                            note: data.getAt(index),
                          ));
            },
          )),
    );
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
