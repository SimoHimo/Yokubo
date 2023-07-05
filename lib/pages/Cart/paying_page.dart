import 'package:flutter/material.dart';

class ToPay extends StatelessWidget {
  const ToPay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle,size: 50,color: Colors.green,),
            Text("Payment Successful!"),
          ],
        ),
      ),
    );
  }
}
