part of 'add_note_cubit_cubit.dart';

@immutable
sealed class AddNoteCubitState {}

final class AddNoteCubitInitial extends AddNoteCubitState {}

class AddNoteLoadingState extends AddNoteCubitState {}

class AddNoteSuccessState extends AddNoteCubitState {}

class AddNoteFailureState extends AddNoteCubitState {
  final String errorMessage;

  AddNoteFailureState({required this.errorMessage});
}
