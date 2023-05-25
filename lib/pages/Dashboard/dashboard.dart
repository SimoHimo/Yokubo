import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yokubo/pages/Dashboard/dashboard_controller.dart';
import '../../custom_animated_bottom_bar.dart';
import '../Cart/cart_page.dart';
import '../Home/homepage.dart';
import '../Messeges/messege_page.dart';
import '../Profile/profile_page.dart';



class DashBoard extends StatefulWidget {

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _currentIndex = 0;
  var black = const Color(0xff2c3e50);

  final _inactiveColor = Colors.grey;
  final _activeColor = Color(0xff2c3e50);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller){
      return Scaffold(
          body: SafeArea(
            child: IndexedStack(
            index: controller.tabIndex,
              children: const [
                HomePage(),
                CartPage(),
                NotificationPage(),
                ProfilePage(),
              ],
            ),
          ),
          bottomNavigationBar: CustomAnimatedBottomBar(
            containerHeight: 70,
            backgroundColor: Colors.white,
            selectedIndex: controller.tabIndex,
            showElevation: true,
            itemCornerRadius: 24,
            curve: Curves.easeIn,
            onItemSelected: controller.changeTabIndex,
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: Icon(Icons.apps),
                title: Text('Home'),
                activeColor: _activeColor,
                inactiveColor: _inactiveColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.shopping_cart_rounded),
                title: Text('Cart'),
                activeColor: _activeColor,
                inactiveColor: _inactiveColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.messenger),
                title: Text(
                  'Messeges',
                ),
                activeColor: _activeColor,
                inactiveColor: _inactiveColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.account_circle),
                title: Text('Profile'),
                activeColor: _activeColor,
                inactiveColor: _inactiveColor,
                textAlign: TextAlign.center,
              ),
            ],
          )
      );
    });
  }
}