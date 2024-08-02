part of 'notes_cubit.dart';

@immutable
sealed class NoteState {}

final class NotesInitial extends NoteState {}

final class NoteEditLoading extends NoteState {}

final class NoteEditSuccess extends NoteState {}

final class NoteEditFailure extends NoteState {
  NoteEditFailure({required this.errorMessage});
  final String errorMessage;
}

class NoteDeleteLoading extends NoteState {}

class NoteDeleteSuccess extends NoteState {}

class NoteDeleteFailure extends NoteState {
  final String errorMessage;

  NoteDeleteFailure({required this.errorMessage});
}
