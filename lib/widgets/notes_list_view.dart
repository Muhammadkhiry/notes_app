import 'package:flutter/material.dart';
import 'package:note_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 11,
        itemBuilder: (BuildContext context, int index) {
          return NoteItem();
        },
      ),
    );
  }
}
