part of 'delete_note_cubit.dart';

@immutable
sealed class DeleteNoteState {}

final class DeleteNoteInitial extends DeleteNoteState {}

final class DeleteNoteLoading extends DeleteNoteState {}

final class DeleteNoteSucceeded extends DeleteNoteState {}

final class DeleteNotFailure extends DeleteNoteState {}
