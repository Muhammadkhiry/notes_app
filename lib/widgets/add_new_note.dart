import 'package:flutter/material.dart';
import 'package:note_app/widgets/add_note_form.dart';

class AddNewNote extends StatelessWidget {
  const AddNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AddNoteForm(),
    );
  }
}
