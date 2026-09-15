part of 'read_notes_cubit.dart';

@immutable
sealed class ReadNotesState {}

final class ReadNotesInitial extends ReadNotesState {}

final class ReadNotesSucceeded extends ReadNotesState {
  final List<NoteModel> notes;

  ReadNotesSucceeded({required this.notes});
}
