import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/consts.dart';
import 'package:note_app/models/note_model.dart';

part 'read_notes_state.dart';

class ReadNotesCubit extends Cubit<ReadNotesState> {
  ReadNotesCubit() : super(ReadNotesInitial());
  List<NoteModel>? notes;
  fetchNotes() {
    var notesBox = Hive.box<NoteModel>(kNoteBox);
    notes = notesBox.values.toList();
    emit(ReadNotesSucceeded(notes: notes!));
  }
}
