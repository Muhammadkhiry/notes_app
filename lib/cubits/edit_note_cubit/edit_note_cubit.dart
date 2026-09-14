import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:meta/meta.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());
}
