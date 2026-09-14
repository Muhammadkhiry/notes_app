import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:meta/meta.dart';

part 'read_notes_state.dart';

class ReadNotesCubit extends Cubit<ReadNotesState> {
  ReadNotesCubit() : super(ReadNotesInitial());
}
