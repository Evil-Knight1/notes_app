import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/notes_model.dart';

part 'add_note_cubit_state.dart';

class AddNoteCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubit() : super(AddNoteCubitInitial());
  var box = Hive.box<NotesModel>(kNotesBox);
  addNote(NotesModel note) async {
    emit(AddNoteLoadingState());
    try {
      await box.add(note);
      emit(AddNoteSuccessState());
    } on Exception catch (e) {
      emit(
        AddNoteFailureState(errorMessage: e.toString()),
      );
    }
  }
}
