import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key, required this.note, required this.formKey});

  final NoteModel note;
  final GlobalKey<FormState> formKey;

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  final titleFocusNode = FocusNode();
  final subtitleFocusNode = FocusNode();

  @override
  void dispose() {
    titleFocusNode.dispose();
    subtitleFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          SizedBox(
            height: 75,
            child: TextFormField(
              initialValue: widget.note.title,
              keyboardType: TextInputType.text,
              focusNode: titleFocusNode,
              textInputAction: TextInputAction.next,

              onFieldSubmitted: (_) {
                subtitleFocusNode.requestFocus();
              },

              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "This field is required";
                }
                return null;
              },

              onSaved: (value) {
                widget.note.title = value!;
              },

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Title:",
              ),
            ),
          ),

          const SizedBox(height: 25),

          SizedBox(
            height: 155,
            child: TextFormField(
              initialValue: widget.note.subTitle,
              focusNode: subtitleFocusNode,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              maxLines: 5,

              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "This field is required";
                }
                return null;
              },

              onSaved: (value) {
                widget.note.subTitle = value!;
              },

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Content:",
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
