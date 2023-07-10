import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';
import 'package:get/get.dart';
import 'package:yokubo/pages/Dashboard/dashboard.dart';
import 'package:yokubo/pages/Login/my_button.dart';
import 'package:yokubo/pages/Login/my_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  Future signUserUp() async {
    if(passwordController.text.trim()==confirmController.text.trim()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    }
    else{
      Get.snackbar("Try again", "password Didn't match");
    }
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
            const SizedBox(
              height: 120,
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
                  "Let's start our journey togather!",
                  style: TextStyle(fontSize: 17, color: Colors.black54),
                )),
            MyTextField(
              hintText: 'Enter Username',
              obscureText: false,
              controller: emailController,
              labelText: 'Email or User Name',
            ),
            MyTextField(
                hintText: "Enter Password",
                obscureText: false,
                controller: passwordController,
                labelText: "Password"),
            MyTextField(
                hintText: "Re-Enter Password",
                obscureText: false,
                controller: confirmController,
                labelText: "Confirm Password"),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Mybutton(
                  buttonName: "Sign Up",
                  onTap: (){
                    signUserUp();

                    // Get.snackbar(
                    //     "Sign Up Successful", "Welcome To Yokubo,Your desire");
                  }),
            ),
            const SizedBox(
              height: 60,
            ),
            SignInButton(
                buttonType: ButtonType.google,
                elevation: 0.9,
                onPressed: () {}),
            SignInButton(
                buttonType: ButtonType.apple, elevation: 0.9, onPressed: () {}),
          ],
        ),
      ),
    ));
  }
}
