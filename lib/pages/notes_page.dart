import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/custom_drawer.dart';
import 'package:notes_app/widgets/custom_floating_action_button.dart';
import 'package:notes_app/widgets/custom_icon_button.dart';
import 'package:notes_app/widgets/custom_note_item.dart';
import 'package:notes_app/widgets/custom_text_button.dart';
import 'package:notes_app/widgets/search_field.dart';

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

  bool _isSearching = false;
  List<NotesModel> notes = [];
  List<NotesModel> searchedNotes = [];
  final TextEditingController _controller = TextEditingController();
  void addSearchedForItemsToSearchedList(String searchedNote) {
    searchedNotes = notes
        .where((note) =>
            note.title.toLowerCase().contains(searchedNote.toLowerCase()))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: _isSearching
              ? BackButton(
                  onPressed: () {
                    setState(() {
                      _controller.clear();
                      _isSearching = false;
                    });
                    Navigator.pop(context);
                  },
                )
              : null,
          title: _isSearching
              ? SearchField(
                  controller: _controller,
                  hint: 'Find Note',
                  onChanged: (searchedNote) {
                    addSearchedForItemsToSearchedList(searchedNote);
                  },
                )
              : _buildAppBarTitle(),
          actions: _buildAppBarActions(),
        ),
        drawer: const CustomDrawer(),
        floatingActionButton: const CustomFloatingActionButton(),
        body: BlocBuilder<NotesCubit, NoteState>(
          builder: (context, state) {
            notes = context.read<NotesCubit>().notes;
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
                              onPressed: () => CustomFloatingActionButton
                                  .customModalBottomSheet(context),
                            ),
                          ),
                        ]),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _isSearching && _controller.text.isNotEmpty
                        ? searchedNotes.length
                        : notes.length,
                    itemBuilder: (context, index) => CustomNoteItem(
                          note: _isSearching && _controller.text.isNotEmpty
                              ? searchedNotes[index]
                              : notes[index],
                        ));
          },
        ));
  }

  Widget _buildAppBarTitle() {
    return const Text(
      'Notes',
      style: TextStyle(fontSize: 36),
    );
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            if (_controller.text != "") {
              _controller.clear();
              setState(() {});
            } else {
              _isSearching = false;
              setState(() {});
              Navigator.pop(context);
            }
          },
          icon: const Icon(Icons.clear),
        ),
      ];
    } else {
      return [
        CustomIconButton(
          icon: const Icon(
            Icons.search,
            size: 32,
          ),
          backgroundColor: const Color(0x639E9E9E),
          onPressed: () => _startSearch(),
          tooltip: 'Search Bar',
        ),
        const SizedBox(
          width: 20,
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    _controller.clear();
    setState(() {
      _isSearching = false;
    });
  }
}
