import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/edit_note_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0),
        child: Column(
          children: [
            const SizedBox(height: 55),

            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),

                Expanded(
                  child: CustomAppBar(
                    title: "Edit",
                    icon: Icons.check_sharp,
                    function: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        await note.save();

                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      }
                      BlocProvider.of<ReadNotesCubit>(context).fetchNotes();
                    },
                  ),
                ),
              ],
            ),

            EditNoteBody(note: note, formKey: formKey),
          ],
        ),
      ),
    );
  }
}
