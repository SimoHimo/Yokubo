import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../Cart/cart_page.dart';
import '../Home/homepage.dart';
import '../Notifications/notification_page.dart';
import '../Profile/profile_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard> {
  List<Widget> pages = [
    const HomePage(),
    CartPage(),
    const NotificationPage(),
    const ProfilePage(),
  ];

  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    var white = const Color(0xfff6f4f3);
    var black = const Color(0xff2c3e50);
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: tabIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(
          backgroundColor: white,
          color: black,
          activeColor: white,
          hoverColor: black,
          //tabActiveBorder: Border.all(color: black, width: 1),
          tabBackgroundColor: black,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          gap: 10,
          onTabChange: changeTabIndex,
          tabs: const [
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
