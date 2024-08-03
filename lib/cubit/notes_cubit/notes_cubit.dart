import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/notes_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NoteState> {
  NotesCubit() : super(NotesInitial());
  var box = Hive.box<NotesModel>(kNotesBox);

  editNote(int index, NotesModel note) {
    emit(NoteEditLoading());

    try {
      box.putAt(index, note);
      emit(NoteEditSuccess());
    } catch (e) {
      emit(NoteEditFailure(errorMessage: e.toString()));
    }
  }
}
