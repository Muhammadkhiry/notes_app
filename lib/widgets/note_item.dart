import 'package:flutter/material.dart';
import 'package:note_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView();
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 7),
        child: Container(
          padding: EdgeInsets.all(11),
          decoration: BoxDecoration(
            color: Color(0xffFFCD7A),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    "Flutter tips",
                    style: TextStyle(color: Colors.black, fontSize: 32),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    "Build your career",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 16,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/icons/trash-bin.png",
                    color: Colors.black,
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              Text(
                "date",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
