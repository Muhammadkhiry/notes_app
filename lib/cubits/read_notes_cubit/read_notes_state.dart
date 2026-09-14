part of 'read_notes_cubit.dart';

@immutable
sealed class ReadNotesState {}

final class ReadNotesInitial extends ReadNotesState {}

final class ReadNotesLoading extends ReadNotesState {}

final class ReadNotesSucceeded extends ReadNotesState {}

final class ReadNotesFailure extends ReadNotesState {}
