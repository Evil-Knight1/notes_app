import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/pages/fav_notes_page.dart';
import 'package:notes_app/pages/settings_page.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/add_note.dart';
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
    print(searchedNotes);
    print(notes.length);
    setState(() {});
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
                  hint: 'Find Characters',
                  onChanged: (searchedNote) {
                    addSearchedForItemsToSearchedList(searchedNote);
                  },
                )
              : _buildAppBarTitle(),
          actions: _buildAppBarActions(),
        ),
        drawer: const CustomDrawer(),
        floatingActionButton: customFloatingActionButton(context),
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
                              onPressed: () => customModalBottomSheet(context),
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

  FloatingActionButton customFloatingActionButton(BuildContext context) {
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

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const SizedBox(
            height: 100,
            child: ListTile(
              tileColor: Colors.amber,
              textColor: Colors.white,
              title: Center(
                  child: Text(
                'Notes App',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.note),
            title: Text('Home'),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorite'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FavNotesPage())),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('settings'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingsPage())),
          ),
        ],
      ),
    );
  }
}
