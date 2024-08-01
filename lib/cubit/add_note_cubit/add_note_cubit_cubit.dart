import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/notes_model.dart';

part 'add_note_cubit_state.dart';

class AddNoteCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubit() : super(AddNoteCubitInitial());

  addNote(NotesModel note) async {
    emit(AddNoteLoadingState());
    try {
      await Hive.box(kNotesBox).add(note);
      emit(AddNoteSuccessState());
    } on Exception catch (e) {
      AddNoteFailureState(errorMessage: e.toString());
    }
  }
}
