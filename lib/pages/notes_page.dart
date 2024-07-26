import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/widgets/custom_icon_button.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notes',
            style: TextStyle(fontSize: 36),
          ),
          actions: const [
            CustomIconButton(
              icon: Icon(
                Icons.search,
                size: 32,
              ),
              backgroundColor: Color(0x679E9E9E),
              tooltip: 'Search Bar',
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF06FF1B),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            size: 32,
            color: Colors.black,
          ),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const NoteItem();
            }));
  }
}

