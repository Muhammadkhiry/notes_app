import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/consts.dart';
import 'package:note_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  void addNote(NoteModel note) async {
    emit(AddNoteLoading());

    try {
      var notesBox = Hive.box<NoteModel>(kNoteBox);

      await notesBox.add(note);

      emit(AddNoteSucceeded());
    } catch (e) {
      emit(AddNoteFailure(errMessage: e.toString()));
    }
  }
}
