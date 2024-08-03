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


