import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;

  const MyTextField({
    super.key,
    required this.hintText,
  });

  
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 235, 235, 235),
        hintText: hintText,
        focusColor: Colors.red,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey.shade300)),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}