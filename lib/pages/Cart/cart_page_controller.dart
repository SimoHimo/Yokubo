import 'package:get/get.dart';
import 'package:yokubo/pages/Home/model_class.dart';

class CartPageController extends GetxController {
  var productsmap = {}.obs;

  void addProduct(Products products) {
    if (productsmap.containsKey(products)) {
      productsmap[products] += 1;
    } else {
      productsmap[products] = 1;
    }
    Get.snackbar(
      "Product Added", "You Have Added ${products.title} to the cart",
      //snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 1),
    );
  }

  void removeProduct(Products products) {
    if (productsmap.containsKey(products) && productsmap[products] == 1) {
      productsmap.removeWhere((key, value) => key == products);
    } else {
      productsmap[products] -= 1;
    }
    Get.snackbar(
      "Product Removed", "You Have Removed ${products.title} from the cart",
      //snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 1),
    );
  }

  get productTotal => productsmap.entries
      .map((products) => products.key.price * products.value)
      .toList();


  get total => productsmap.entries
      .map((products) => (products.key.price * products.value))
      .toList().reduce((value, element) => value + element).toStringAsFixed(1);
}
