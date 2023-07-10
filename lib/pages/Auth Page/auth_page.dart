import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yokubo/pages/Dashboard/dashboard.dart';
import 'package:yokubo/pages/Login/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //User Logged In
          if(snapshot.hasData){
            print(snapshot);
            return DashBoard();
          }

          //User Not Logged In
          else{return const LoginPage();}
        },
      ),
    );
  }
}
