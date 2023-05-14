import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yokubo/pages/homepage.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarIconBrightness: Brightness.dark
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Yokubo",
      theme: ThemeData(),
      routes: {
        "Home":(context) => HomePage(),
      },
      initialRoute: "Home",
    );
  }
}

