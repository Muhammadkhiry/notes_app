import 'package:flutter/material.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title;
  String? content;

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
                      content = value;
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

            const SizedBox(height: 185),

            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
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
