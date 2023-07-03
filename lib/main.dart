import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yokubo/pages/Dashboard/dashboard.dart';
import 'package:get/get.dart';

import 'pages/Dashboard/dashboard_binding.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Yokubo",
      theme: ThemeData(useMaterial3: true),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=>DashBoard(),
        binding: DashboardBinding()
        ),
      ],
    );
  }
}

