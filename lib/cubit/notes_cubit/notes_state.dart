part of 'notes_cubit.dart';

@immutable
sealed class NoteState {}

final class NotesInitial extends NoteState {}

final class NotesFetchSuccess extends NoteState {}

final class NoteEditLoading extends NoteState {}

final class NoteEditSuccess extends NoteState {}

final class NoteEditFailure extends NoteState {
  NoteEditFailure({required this.errorMessage});
  final String errorMessage;
}

final class AddNoteCubitInitial extends NoteState {}

class AddNoteLoadingState extends NoteState {}

class AddNoteSuccessState extends NoteState {}

class AddNoteFailureState extends NoteState {
  final String errorMessage;

  AddNoteFailureState({required this.errorMessage});
}
