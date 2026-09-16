import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title;
  String? subTitle;
  final titleFocusNode = FocusNode();
  final subtitleFocusNode = FocusNode();
  bool isLoading = false;

  _AddNoteFormState();

  @override
  void dispose() {
    titleFocusNode.dispose();
    subtitleFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 75,
                  child: TextFormField(
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
                      title = value;
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
                    keyboardType: TextInputType.multiline,
                    focusNode: subtitleFocusNode,
                    maxLines: 5,
                    textInputAction: TextInputAction.newline,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "This field is required";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      subTitle = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Content:",
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 95),

            BlocListener<AddNoteCubit, AddNoteState>(
              listener: (BuildContext context, state) {
                if (state is AddNoteLoading) {
                  isLoading = true;
                } else {
                  isLoading = false;
                }
              },
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: isLoading is AddNoteLoading
                    ? SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(color: Colors.black),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            NoteModel note = NoteModel(
                              title: title!,
                              subTitle: subTitle!,
                              date: DateFormat.yMMMEd().format(DateTime.now()),
                              color: Colors.blue.value,
                            );

                            BlocProvider.of<AddNoteCubit>(
                              context,
                            ).addNote(note);
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 9),
          ],
        ),
      ),
    );
  }
}
