import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yokubo/pages/Dashboard/dashboard.dart';
import 'package:get/get.dart';
import 'package:yokubo/pages/Product/product_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yokubo/pages/auth_page.dart';
import 'firebase_options.dart';
import 'pages/Dashboard/dashboard_binding.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
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
      initialRoute: "/auth_page",
      getPages: [
        GetPage(name: "/auth_page", page: ()=>const AuthPage()),
        GetPage(name: "/product_page", page: ()=>const ProductPage()),
        GetPage(name: "/", page: ()=>const DashBoard(), binding: DashboardBinding(),),
      ],
    );
  }
}

