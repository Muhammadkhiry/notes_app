import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesState>(
      builder: (context, state) {
        final List<NoteModel> notes = BlocProvider.of<ReadNotesCubit>(
          context,
        ).notes!;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state is ReadNotesSucceeded ? state.notes.length : 0,
            itemBuilder: (BuildContext context, int index) {
              final note = notes[index];

              return Dismissible(
                key: Key(note.key.toString()),
                direction: DismissDirection.endToStart,

                background: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 30,
                  ),
                ),

                onDismissed: (direction) {
                  note.delete();
                  BlocProvider.of<ReadNotesCubit>(context).fetchNotes();
                },

                child: NoteItem(note: note),
              );
            },
          ),
        );
      },
    );
  }
}
