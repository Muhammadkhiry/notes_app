import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:note_app/widgets/add_note_form.dart';

class AddNewNote extends StatelessWidget {
  const AddNewNote({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: SingleChildScrollView(
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteSucceeded) {
              BlocProvider.of<ReadNotesCubit>(context).fetchNotes();
              Navigator.pop(context);
            }
            if (state is AddNoteFailure) {
              print(state.errMessage);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading,
              child: AddNoteForm(),
            );
          },
        ),
      ),
    );
  }
}
