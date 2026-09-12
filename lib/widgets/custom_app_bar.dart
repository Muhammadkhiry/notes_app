import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    this.function,
  });
  final String title;
  final IconData icon;
  final VoidCallback? function;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 215),
        Container(
          decoration: BoxDecoration(
            color: Color(0xff3B3B3B),
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            onPressed: function,
            icon: Icon(icon),
            iconSize: 32,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
