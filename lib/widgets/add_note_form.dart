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

  _AddNoteFormState();

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
                    maxLines: 5,
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

            SizedBox(
              width: double.infinity,
              height: 45,
              child: State is AddNoteLoading
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
                            date: DateFormat.yMMMEd()
                                .format(DateTime.now())
                                .toString(),
                            color: Colors.blue.value,
                          );

                          BlocProvider.of<AddNoteCubit>(context).addNote(note);
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

            const SizedBox(height: 9),
          ],
        ),
      ),
    );
  }
}
