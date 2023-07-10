import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({super.key, required this.onTap, required this.buttonName});
final void Function() onTap;
final String buttonName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        height: 50,
        width: 300,
        decoration: BoxDecoration(
            color: const Color(0xff2c3e50),
          borderRadius: BorderRadius.circular(50)
        ),
        child: Center(child: Text(buttonName,style: const TextStyle(color: Colors.white)),),
      ),
    );
  }
}
