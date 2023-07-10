import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final labelText;

  const MyTextField(
      {super.key,
      this.controller,
      required this.hintText,
      required this.obscureText, this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: TextField(

        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          fillColor: Colors.grey.shade200,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50)
          ),
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500)
        ),
      ),
    );
  }
}
