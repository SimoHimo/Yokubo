import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yokubo/pages/Dashboard/dashboard.dart';
import 'package:yokubo/pages/Dashboard/navigation_bar.dart';
import 'package:yokubo/pages/Home/homepage.dart';
import 'package:yokubo/pages/Login/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //User Logged In
         if(snapshot.hasData){
           return const NavBar();
         }

          //User Not Logged In
          else{return const LoginPage();}
        },
      ),
    );
  }
}
