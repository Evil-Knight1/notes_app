import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/notes_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NoteState> {
  NotesCubit() : super(NotesInitial());
  var box = Hive.box<NotesModel>(kNotesBox);
  List<NotesModel> notes = [];

  void fetchNotes() async {
    notes.clear();
    var data = box.listenable().value;
    for (int i = 0; i < data.length; i++) {
      notes.add(box.getAt(i)!);
    }
    emit(NotesFetchSuccess());
  }

  addNote(NotesModel note) async {
    emit(AddNoteLoadingState());
    try {
      await box.add(note);
      emit(AddNoteSuccessState());
      fetchNotes();
    } on Exception catch (e) {
      emit(
        AddNoteFailureState(errorMessage: e.toString()),
      );
    }

    editNote(int index, NotesModel note) {
      emit(NoteEditLoading());
      try {
        box.putAt(index, note);
        emit(NoteEditSuccess());
        fetchNotes();
      } catch (e) {
        emit(NoteEditFailure(errorMessage: e.toString()));
      }
    }
  }
}
