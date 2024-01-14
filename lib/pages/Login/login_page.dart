import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sign_button/sign_button.dart';
import 'package:get/get.dart';
import 'package:yokubo/pages/Login/my_button.dart';
import 'package:yokubo/pages/Login/my_textfield.dart';
import 'package:yokubo/pages/Login/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    Fluttertoast.showToast(msg: "Signing in",
    );
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    var height = (MediaQuery.of(context).size.height) / 100;
    //var width = (MediaQuery.of(context).size.width) / 100;
    return Scaffold(
        body: SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(
              height: height*10,
            ),
            SizedBox(
              height: height * 18,
              width: height * 36,
              child: const Image(
                  image: AssetImage('assets/images/LogoSide.png'),
                  fit: BoxFit.fitHeight),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Welcome back, we were missing you!',
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                )),
            MyTextField(
              hintText: 'Enter Username',
              obscureText: false,
              controller: emailController,
              labelText: 'User Name',
            ),
            MyTextField(
                hintText: "Enter Password",
                obscureText: true,
                controller: passwordController,
                labelText: "Password"),
            TextButton(onPressed: () {}, child: const Text('Forgot Password?')),
            Mybutton(buttonName: "Sign In",onTap:
              signUserIn),
            SizedBox(
              height: height*5,
            ),
            SignInButton(
                buttonType: ButtonType.google,
                elevation: 0.9,
                onPressed: () {}),
            SignInButton(
                buttonType: ButtonType.apple, elevation: 0.9, onPressed: () {}),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("   Don't Have an Account?"),
                  TextButton(
                      onPressed: () {
                        Get.to(() => const SignUpPage(),transition: Transition.rightToLeftWithFade);
                      },
                      child: const Text("Sign Up Now"))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
