import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final dynamic controller;
  final String hintText;
  final bool obscureText;
  final String labelText;

  const MyTextField(
      {super.key,
      this.controller,
      required this.hintText,
      required this.obscureText, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: TextField(

        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          fillColor: Colors.grey.shade200,


          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green, width: 5),
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
