import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yokubo/pages/Profile/billing.dart';
import 'package:yokubo/pages/Profile/settings_page.dart';
import 'package:yokubo/pages/Profile/help_page.dart';

import 'about_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> profileitems = [
    "About",
    "Settings",
    "Info",
    "Billing Details",
    "Logout"
  ];

  List<IconData> profileicons = [
    FontAwesomeIcons.addressCard,
    FontAwesomeIcons.gear,
    FontAwesomeIcons.info,
    FontAwesomeIcons.wallet,
    FontAwesomeIcons.rightFromBracket
  ];

  List buttonsfunction = [
    () {Get.to(()=> AboutPage(),transition: Transition.leftToRightWithFade);},
    () {Get.to(()=>const SettingsPage(),transition: Transition.leftToRightWithFade);},
    () {Get.to(()=>const HelpPage(),transition: Transition.leftToRightWithFade);},
    () {Get.to(()=> BillingPage(),transition: Transition.leftToRightWithFade);},
    () {FirebaseAuth.instance.signOut();},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color(0xff2c3e50)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/sherlock.jpg"),
                radius: 50,),
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                "Sherlock Holmes",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2c3e50)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ListView.builder(
                  itemCount: profileitems.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        child: InkWell(
                          onTap: buttonsfunction[index],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 45),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(child: Icon(profileicons[index]),
                                backgroundColor: Color(0x202c3e50),
                                  radius: 22,

                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      profileitems[index],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff2c3e50)),
                                    ),
                                  ),
                                ),
                                CircleAvatar(child: Icon(FontAwesomeIcons.chevronRight),
                                  backgroundColor: Color(0x152c3e50),
                                  radius: 18,)

                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
