import 'package:get/get.dart';
import 'package:yokubo/pages/Cart/cart_page_controller.dart';
import 'package:yokubo/pages/Dashboard/dashboard_controller.dart';
import 'package:yokubo/pages/Home/homepage_controller.dart';
import 'package:yokubo/pages/Notifications/notification_page_controller.dart';
import 'package:yokubo/pages/Profile/profile_page_controller.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomePageController>(() =>HomePageController() );
    Get.lazyPut<CartPageController>(() =>CartPageController() );
    Get.lazyPut<NotificationPageController>(() =>NotificationPageController() );
    Get.lazyPut<ProfilePageController>(() =>ProfilePageController() );
  }
}