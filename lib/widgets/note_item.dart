import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              "Flutter tips",
              style: TextStyle(color: Colors.black, fontSize: 32),
            ),
            subtitle: Text(
              "     Build your career",
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 11, right: 13),
            child: Text(
              "date",
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
