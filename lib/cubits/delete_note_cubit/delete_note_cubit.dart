import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:meta/meta.dart';

part 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit() : super(DeleteNoteInitial());
}
