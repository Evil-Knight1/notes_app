import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/pages/edit_note_page.dart';
import 'package:notes_app/widgets/custom_icon_button.dart';

class CustomNoteItem extends StatefulWidget {
  const CustomNoteItem({
    super.key,
    required this.note,
  });
  final NotesModel note;

  @override
  State<CustomNoteItem> createState() => _CustomNoteItemState();
}

class _CustomNoteItemState extends State<CustomNoteItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      secondaryBackground: Container(
        color: Colors.redAccent,
        child: const Icon(
          Icons.delete,
          size: 32,
        ),
      ),
      background: Container(
        color: Colors.blue,
        child: const Icon(
          Icons.edit,
          size: 32,
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          widget.note.delete();
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditNotePage(note: widget.note)));
        }
        setState(() {});
      },
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, _, __) => EditNotePage(
                  note: widget.note,
                ),
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
            color: Color(widget.note.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  widget.note.title,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    widget.note.desc,
                    style: const TextStyle(fontSize: 18, color: Colors.black45),
                  ),
                ),
                trailing: CustomIconButton(
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 24,
                  ),
                  onPressed: () => widget.note.delete(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  widget.note.time,
                  style: const TextStyle(color: Colors.black38, fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
