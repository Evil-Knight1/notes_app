import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/pages/edit_note_page.dart';
import 'package:notes_app/widgets/custom_icon_button.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({
    super.key,
    required this.note,
  });
  final NotesModel note;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, _, __) => const EditNotePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                final tween = Tween(begin: begin, end: end);
                final offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xffffcd7a),
          borderRadius: BorderRadius.circular(16),
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:  Text(
                note.title,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              subtitle:  Padding(
                padding:const EdgeInsets.only(top: 24),
                child: Text(
                  note.desc,
                  style:const TextStyle(fontSize: 18, color: Colors.black45),
                ),
              ),
              trailing: const CustomIconButton(
                icon: Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
             Padding(
              padding:const EdgeInsets.only(right: 24),
              child: Text(
                note.time,
                style: const TextStyle(color: Colors.black38, fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
