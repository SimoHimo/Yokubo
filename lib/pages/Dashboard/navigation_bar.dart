import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  Widget build(BuildContext context) {
    var white =  Color(0xfff6f4f3);
    var black =  Color(0xff2c3e50);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(
          backgroundColor: Color(0xfff6f4f3),
          color: Color(0xff2c3e50),
          activeColor: Color(0xfff6f4f3),
          hoverColor: Color(0xff2c3e50),
          tabActiveBorder: Border.all(color: Colors.black, width: 1),
          tabBackgroundColor: Color(0xff2c3e50),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),



          gap: 10,
          tabs: [
            GButton(
              icon: FontAwesomeIcons.house,
              text: 'Home',
            ),
            GButton(
              icon: FontAwesomeIcons.cartPlus,
              text: 'Cart',
            ),
            GButton(
              icon: FontAwesomeIcons.message,
              text: "Notifications",
            ),
            GButton(
              icon: FontAwesomeIcons.userAstronaut,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
