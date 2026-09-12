import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 11, left: 11),
      child: ListView(
        padding: EdgeInsets.only(bottom: 5),
        children: [
          SizedBox(height: 35),
          CustomAppBar(),
          SizedBox(height: 11),
          NoteItem(),
        ],
      ),
    );
  }
}
