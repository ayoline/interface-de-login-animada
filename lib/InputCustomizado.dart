// ignore_for_file: file_names
import 'package:flutter/material.dart';

class InputCustomizado extends StatelessWidget {
  final String hint;
  final bool obscure;
  final Icon icon;

  InputCustomizado({
    required this.hint,
    this.obscure = false,
    this.icon = const Icon(Icons.person),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          icon: icon,
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
