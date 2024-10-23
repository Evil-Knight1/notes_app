import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
    );
  }

  static Future<void> customModalBottomSheet(BuildContext context) {
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
