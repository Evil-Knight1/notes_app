import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/pages/edit_note_page.dart';
import 'package:notes_app/widgets/custom_icon_button.dart';

class CustomNoteItem extends StatefulWidget {
  const CustomNoteItem({
    super.key,
    required this.note,
    this.favScreen = false,
  });
  final NotesModel note;
  final bool favScreen;

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
          context.read<NotesCubit>().fetchNotes();
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditNotePage(note: widget.note)));
          BlocProvider.of<NotesCubit>(context).fetchNotes();
        }
      },
      child: InkWell(
        onTap: () {
          navToEditNotePage(context);
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
                  icon: Icon(
                    widget.note.fav!
                        ? FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart,
                    color: widget.note.fav! ? Colors.red : Colors.black,
                    size: 24,
                  ),
                  onPressed: () {
                    setState(() => widget.note.fav = !widget.note.fav!);
                    widget.note.save();
                    BlocProvider.of<NotesCubit>(context).fetchNotes();
                  },
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

  void navToEditNotePage(BuildContext context) {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, _, __) => EditNotePage(
            note: widget.note,
          ),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            const Offset begin = Offset(0.0, 1.0);
            const Offset end = Offset.zero;
            final Tween<Offset> tween = Tween<Offset>(begin: begin, end: end);
            final Animation<Offset> offsetAnimation =
                animation.drive<Offset>(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ));
  }
}
