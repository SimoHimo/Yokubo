import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});
  void launchURL(url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    var black = const Color(0xff2c3e50);
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("For any Inquiry",style: TextStyle(fontSize: 25,color: black,fontWeight: FontWeight.w500),),
          Text("Email at: syedmishkatulhaque@gmail.com",style: TextStyle(fontSize: 15,color: black,fontWeight: FontWeight.w500),),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(onPressed:(){launchURL(Uri.parse(
                "mailto:syedmishkatulhaque@gmail.com?subject=regarding Yokubo App"));} , child: const Text("Contact")),
          )
        ],

      )),

    );
  }
}
