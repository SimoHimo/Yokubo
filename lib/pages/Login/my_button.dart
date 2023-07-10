import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({super.key, required this.onTap});
final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        height: 50,
        width: 300,
        decoration: BoxDecoration(
            color: Color(0xff2c3e50),
          borderRadius: BorderRadius.circular(50)
        ),
        child: Center(child: Text("Sign in",style: TextStyle(color: Colors.white)),),
      ),
    );
  }
}
